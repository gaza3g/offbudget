Offbudget::Application.routes.draw do
  
  devise_for :users

  match '/', :to => 'pages#home'
 
 end
 
