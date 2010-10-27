Offbudget::Application.routes.draw do

  get "reports/index"

  get "dailies/index"

  resources                     :budgets
  resources                     :items
  resources                     :incomes
  resources                     :dailies
  resources                     :reports
  
  get       'pages/home'
  match     '/budget/update',   :to => 'budgets#update' 
  match     '/item/update',     :to => 'items#update' 
  match     '/income/update',   :to => 'incomes#update' 
  match     '/daily/update',    :to => 'dailies#update'
  match     '/contact',         :to => 'pages#contact'
  match     '/about',           :to => 'pages#about'
  match     '/help',            :to => 'pages#help'
  devise_for                    :users

  root                          :to => 'pages#index'
 
 end
 
