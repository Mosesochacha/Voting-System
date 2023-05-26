Rails.application.routes.draw do
  # resources :voters
  get "/voters", to: 'voters#index'
  post "/voters/:ward_id", to: 'voters#register_voter'
  resources :candidates
  resources :partieex
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
