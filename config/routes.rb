Rails.application.routes.draw do
  #get 'items/index'
  #get 'images/index'
  devise_for :users
  
  root to: "items#index"
  
end
