Nwa::Application.routes.draw do
  devise_for :admins

  match "/companies/list", :controller => 'companies', :action => 'list', :as => 'list_companies'
  resources :companies
  root :to => "companies#index"
end
