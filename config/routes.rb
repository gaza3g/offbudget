Offbudget::Application.routes.draw do
  
  get "budgets/index"

  get "budgets/create"

  get "budget/index"

  get "budget/create"

  resources :budgets

  get 'pages/home'
  
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  devise_for :users

  root :to => 'pages#index'
 
 end
 
