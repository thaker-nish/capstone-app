Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'pages#home'
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
  post '/promoters/follow' => 'promoters#create_follow'
  delete '/promoters/unfollow/:id' => 'promoters#destroy_unfollow'
  get '/promoters/clubs/new' => 'promoters#new_club'
  post '/promoters/clubs' => 'promoters#create_club'
  get '/promoters/:id' => 'promoters#show'
  post '/promoters/comments' => 'promoters#create_comment'

  get '/clubs/locations' => 'clubs#index_locations'
  get '/clubs/locations/:id' => 'clubs#show_locations'
  get '/clubs/:id' => 'clubs#show'

  get '/messages/:id' => 'messages#show'
  post '/user_messages' => 'messages#create_user_message'
  post '/promoter_messages' => 'messages#create_promotion_message'

end
