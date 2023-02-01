Rails.application.routes.draw do
  root 'displayables#index'
  resources :displayables
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
