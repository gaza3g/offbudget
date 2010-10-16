Offbudget::Application.routes.draw do
  
  get 'pages/home'
  devise_for :users

  root :to => 'pages#index'
 
 end
 
