Offbudget::Application.routes.draw do

  resources                   :budgets
  resources                   :items
  
  get       'pages/home'
  match     '/budget/update', :to => 'budgets#update' 
  match     '/item/update',   :to => 'items#update' 
  match     '/contact',       :to => 'pages#contact'
  match     '/about',         :to => 'pages#about'
  match     '/help',          :to => 'pages#help'
  devise_for                  :users

  root                        :to => 'pages#index'
 
 end
 
