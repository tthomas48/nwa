Nwa::Application.routes.draw do

  devise_for :admins

  match "/companies/list", :controller => 'companies', :action => 'list', :as => 'list_companies'
  match "/companies/alias/:id", :controller => 'companies', :action => 'alias', :as => 'alias_company', :via => [:get]
  match "/companies/alias/:id", :controller => 'companies', :action => 'update', :via => [:post]


  resources :companies
  root :to => "companies#index"
end
