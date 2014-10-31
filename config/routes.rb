Rails.application.routes.draw do

  root 'users#new'
  
  # scope do
  #   resources :users, path: 'results'
  # end
  
  # resources :sessions

resources :users

end
