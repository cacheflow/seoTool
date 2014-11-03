Rails.application.routes.draw do

  root 'users#new'
  
  scope do 
  	resources :users, path: "results"
  end 


  # scope do
  #   resources :users, path: 'results'
  # end
  
  # resources :sessions

end
