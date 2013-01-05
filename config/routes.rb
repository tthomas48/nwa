Nwa::Application.routes.draw do

  match "/locations/list", :controller => 'locations', :action => 'list', :as => 'list_locations'
  resources :locations

  get "static/resources"

  devise_for :admins

  match "/companies/updateFeedItems", :controller => 'companies', :action => 'updateFeedItems', :as => 'updateFeedItems', :via => [:get]
  match "/companies/contact", :controller => 'companies', :action => 'contact', :as => 'contact', :via => [:get]
  match "/companies/contact", :controller => 'companies', :action => 'contact_send', :as => 'contact', :via => [:post]
  match "/companies/list", :controller => 'companies', :action => 'list', :as => 'list_companies'
  match "/companies/alias/:id", :controller => 'companies', :action => 'alias', :as => 'alias_company', :via => [:get]
  match "/companies/alias/:id", :controller => 'companies', :action => 'update', :via => [:post]


  resources :companies
  root :to => "companies#index"
end
