Rails.application.routes.draw do

  get "sessions/new" => "sessions#new"
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  get 'users/:id' => 'users#show'

end
