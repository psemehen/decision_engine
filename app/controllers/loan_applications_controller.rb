class LoanApplicationsController < ApplicationController
  def index
    @loan_applications = LoanApplication.all
  end

  def show
    loan_application
  end

  def new
    @loan_application = LoanApplication.new
  end

  def create
    @loan_application = LoanApplication.new(loan_application_params)

    if @loan_application.valid?
      process_loan_application
    else
      render :new
    end
  end

  def destroy
    if loan_application.destroy
      flash[:success] = "Loan application was successfully deleted"
    else
      flash[:error] = loan_application.errors.full_messages
    end

    redirect_to loan_applications_path
  end

  private

  def loan_application
    @loan_application ||= LoanApplication.find(params[:id])
  end

  def loan_application_params
    params.require(:loan_application).permit(:personal_code, :loan_amount, :loan_period)
  end

  def process_loan_application
    if @loan_application.credit_score >= 1
      process_positive_decision
    else
      process_negative_decision
    end
  end

  def process_positive_decision
    @loan_application.approved_amount = @loan_application.max_approved_amount

    if @loan_application.save
      flash[:success] = "Loan decision is positive. Loan amount is #{@loan_application.approved_amount}"
      redirect_to loan_application_path(@loan_application)
    else
      render :new
    end
  end

  def process_negative_decision
    flash.now[:error] = "Loan decision is negative."
    render :new
  end
end
