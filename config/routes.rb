Rails.application.routes.draw do
  get '/comments/new' => 'comments#new'
  post '/comments' => 'comments/create'
end
