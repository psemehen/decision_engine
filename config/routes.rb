Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "loan_applications#index"
  resources :loan_applications, only: [:create, :new, :show, :index, :destroy]
end
