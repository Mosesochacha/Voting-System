Rails.application.routes.draw do
  # Voters routes
  # get "/voters", to: "voters#index"
  # post "/voters/:ward_id", to: "voters#register_voter"
  # get "/voters/email/:email", to: "voters#show", as: "voter_email"
  # get "/voters/:id", to: "voters#show", as: "voter", constraints: { id: /[^\@]+/ }
  # patch "/voters/:id", to: "voters#update"
  # delete "/voters/:id", to: "voters#destroy"

   get '/candidates/:level', to: 'candidates#index'

  # get "/parties", to: "parties#index"
  # post "/parties", to: "parties#create"
  # get "/parties/:id", to: "parties#show", as: "party"
  # patch "/parties/:id", to: "parties#update"
  # delete "/parties/:id", to: "parties#destroy"

  # get "/positions", to: "positions#index"
  # post "/positions", to: "positions#create"
  # get "/positions/:id", to: "positions#show", as: "position"
  # patch "/positions/:id", to: "positions#update"
  # delete "/positions/:id", to: "positions#destroy"

  get "/users/:id", to: "users#show", as: "user"
  post "/register", to: "users#create"
  post "/login", to: "users#authenticate"
  delete "/logout", to: "users#destroy"
  get '/check_login', to: 'users#check_login'

  # get "/wards", to: "wards#index"
  # post "/wards", to: "wards#create"
  # get "/wards/:id", to: "wards#show", as: "ward"
  # patch "/wards/:id", to: "wards#update"
  # delete "/wards/:id", to: "wards#destroy"

  # get "/subcounties", to: "subcounties#index"
  # post "/subcounties", to: "subcounties#create"
  # get "/subcounties/:id", to: "subcounties#show", as: "subcounty"
  # patch "/subcounties/:id", to: "subcounties#update"
  # delete "/subcounties/:id", to: "subcounties#destroy"

  # get "/counties", to: "counties#index"
  # post "/counties", to: "counties#create"
  # get "/counties/:id", to: "counties#show", as: "county"
  # patch "/counties/:id", to: "counties#update"
  # delete "/counties/:id", to: "counties#destroy"

  # get "/nationals", to: "nationals#index"
  # post "/nationals", to: "nationals#create"
  # get "/nationals/:id", to: "nationals#show", as: "national"
  # patch "/nationals/:id", to: "nationals#update"
  # delete "/nationals/:id", to: "nationals#destroy"
end
