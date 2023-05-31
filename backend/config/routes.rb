Rails.application.routes.draw do
  # resources :votes

  # get "/mcas" , to: "votes#get_mcas"
  # get "govornor" to: "votes#get_govonre"
  # get "/President" , to: "votes#get_President"
  # get "/Senator" , to: "votes#get_Senator"
  # get "/Women_Representative" , to: "votes#get_Women_Representative"
  # get "/Member_of_Parliament" , to: "votes#Member_of_Parliament"
  # get "/Member_of_Count_ Assembly" , to: "votes#Member_of_Count_ Assembly"

  # post "/mcas" , to: "votes#craete_mcas"
  # post "govornor" to: "votes#craete_govonre"
  # post "/President" , to: "votes#craete_President"
  # post "/Senator" , to: "votes#craete_Senator"
  # post "/Women_Representative" , to: "votes#craete_Women_Representative"
  # post "/Member_of_Parliament" , to: "votes#craete_Member_of_Parliament"
  # post "/Member_of_Count_ Assembly" , to: "votes#craete_Member_of_Count_ Assembly"

  # Voters routes
  get "/voters", to: "voters#index"
  post "/voters/:ward_id", to: "voters#register_voter"
  get "/voters/email/:email", to: "voters#show", as: "voter_email"
  get "/voters/:id", to: "voters#show", as: "voter", constraints: { id: /[^\@]+/ }
  patch "/voters/:id", to: "voters#update"
  delete "/voters/:id", to: "voters#destroy"

  get "/candidates/:level", to: "candidates#index"
  get "vacancies", to: "candidates#vacancies"
  post "candidates/:level", to: "candidates#create"

  get "/parties", to: "parties#index"
  post "/parties", to: "parties#create"
  get "/parties/:id", to: "parties#show", as: "party"
  patch "/parties/:id", to: "parties#update"
  delete "/parties/:id", to: "parties#destroy"

  get "/positions", to: "positions#index"
  post "/positions", to: "positions#create"
  get "/positions/:id", to: "positions#show", as: "position"
  patch "/positions/:id", to: "positions#update"
  delete "/positions/:id", to: "positions#destroy"

  get "/users/:id", to: "users#show", as: "user"
  post "/register", to: "users#create"
  post "/login", to: "users#authenticate"
  delete "/logout", to: "users#destroy"
  get "/check_login", to: "users#check_login"

  get "/wards", to: "wards#index"
  post "/wards", to: "wards#create"
  get "/wards/:id", to: "wards#show", as: "ward"
  patch "/wards/:id", to: "wards#update"
  delete "/wards/:id", to: "wards#destroy"

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

  # Routes for BallotsController
  get '/governor', to: 'ballots#get_governor'
  get '/president', to: 'ballots#get_president'
  get '/senator', to: 'ballots#get_senator'
  get '/women_rep', to: 'ballots#get_women_rep'
  get '/member_of_parliament', to: 'ballots#get_member_of_parliament'
  get '/membercounty', to: 'ballots#get_member_of_county_assembly'
end
