Rails.application.routes.draw do
  post '/users/login', to:"users#login"
  post '/users/logout', to:"users#logout"
  post '/users', to:"users#index"
  patch '/users', to:"users#update"
  put '/users', to:"users#update"
  post '/users/create', to:"users#create"
  delete '/users', to:"users#destroy"



end
