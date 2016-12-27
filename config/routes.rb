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
  get '/promoters_signup' => 'promoters#new'
  post '/promoters' => 'promoters#create'
  get '/promoters_login' => 'promoters_sessions#new'
  post '/promoters_login' => 'promoters_sessions#create'
  get '/promoters_logout' => 'promoters_sessions#destroy'
  get '/promoters/:id' => 'promoters#show'

  get '/clubs' => 'clubs#index'
  get '/clubs/:id' => 'clubs#show'
end
