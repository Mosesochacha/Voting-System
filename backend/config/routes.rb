Rails.application.routes.draw do
  resources :voters
  resources :candidates
  resources :parties
  resources :positions
  resources :users
  resources :wards
  resources :subcounties
  resources :counties
  resources :nationals
  
  #User Routes
  post '/register', to: 'users#create'
  post '/login', to: 'users#authenticate'
  delete '/logout', to: 'users#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
