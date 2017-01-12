Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'pages#home'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/users/:id' => 'users#show'

  get '/promoters' => 'promoters#index'
  post '/promoters' => 'promoters#create'
  get '/promoters_login' => 'promoters_sessions#new'
  post '/promoters_login' => 'promoters_sessions#create'
  get '/promoters_logout' => 'promoters_sessions#destroy'
  get '/promoters/promotion/new' => 'promoters#new_promotion'
  post '/promoters/promotion' => 'promoters#create_promotion'
  get '/promoters/guestlist/new' => 'promoters#new_guestlist'
  post '/promoters/guestlist' => 'promoters#create_guestlist'
  get '/promoters/:id' => 'promoters#show'

  get '/clubs/locations' => 'clubs#index_locations'
  get '/clubs/locations/:id' => 'clubs#show_locations'
  get '/clubs/:id' => 'clubs#show'
end
