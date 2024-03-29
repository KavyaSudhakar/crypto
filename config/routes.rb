Rails.application.routes.draw do
  resources :portfolios
  devise_for :users

    resource :user

  get 'about', to: 'home#about'
  get 'home/lookup'
  get "home/lookup" => 'home#lookup'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
