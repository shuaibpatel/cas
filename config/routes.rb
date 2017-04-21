Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  get "/sales" => "sales#index", as: "sales_index"
  get "/sales/report" => "sales#report", as: "sales_report"

  resources :sales



  resources :vds
  resources :products



  get 'info/infogem'

  get 'info/infoauthor'

  get 'info/infolatestgems'

  get 'welcomesp/index'

  resources :dependencies
  get 'sessions/create'

  get 'welcome/index'

  resources :locations


  #root 'welcome#index'

#shuaib api
  #root 'welcomesp#index'
  match 'searchgem', to: 'info#infogem', via: [:get, :post]



  #viak product
  resources :products

  root 'products#index'

  mount Products::ProductsAPI => '/api/products'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to:  redirect("/") , via: [:get, :post]
match 'signout', to: 'sessions#signout', via: [:get, :post]
match 'twittertrends', to: 'welcome#twittertrends', via: [:get, :post]
match 'customtweets', to: 'welcome#customtweets', via: [:get]
match 'morecustomtweets', to: 'welcome#morecustomtweets', via: [:get]
end
