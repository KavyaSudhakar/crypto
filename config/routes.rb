Rails.application.routes.draw do
  devise_for :users

    resource :user

  get 'home/about'
  get 'home/lookup'
  get "home/lookup" => 'home#lookup'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
