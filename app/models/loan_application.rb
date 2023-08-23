class LoanApplication < ApplicationRecord
  validates :personal_code, :loan_amount, :loan_period, presence: true
  validates :loan_amount, numericality: {greater_than_or_equal_to: 2000, less_than_or_equal_to: 10000}
  validates :loan_period, numericality: {greater_than_or_equal_to: 12, less_than_or_equal_to: 60}

  def credit_score
    (credit_modifier.to_f / loan_amount) * loan_period
  end

  def credit_modifier
    case personal_code
    when "49002010976"
      100
    when "49002010987"
      300
    when "49002010998"
      1000
    else
      0
    end
  end

  def max_approved_amount
    (credit_modifier <= 0) ? 0 : credit_modifier * loan_period
  end
end
