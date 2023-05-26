Rails.application.routes.draw do
  # Voters routes
  get "/voters", to: 'voters#index'
  post "/voters/:ward_id", to: 'voters#register_voter'
  get '/voters/email/:email', to: 'voters#show', as: 'voter_email'
  get '/voters/:id', to: 'voters#show', as: 'voter', constraints: { id: /[^\@]+/ }
  patch "/voters/:id", to: 'voters#update'
  delete "/voters/:id", to: 'voters#destroy'

  # Other resources routes
  resources :candidates
  resources :parties
  resources :positions
  resources :users
  resources :wards
  resources :subcounties
  resources :counties
  resources :nationals

  # User routes
  post '/register', to: 'users#create'
  post '/login', to: 'users#authenticate'
  delete '/logout', to: 'users#destroy'

  # Defines the root path route ("/")
  # root "articles#index"
end
