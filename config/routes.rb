Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "babies#index"
  # Routes for the Baby resource:
  # CREATE
  get "/babies/new", :controller => "babies", :action => "new"
  post "/create_baby", :controller => "babies", :action => "create"

  # READ
  get "/babies", :controller => "babies", :action => "index"
  get "/babies/:id", :controller => "babies", :action => "show"

  # UPDATE
  get "/babies/:id/edit", :controller => "babies", :action => "edit"
  post "/update_baby/:id", :controller => "babies", :action => "update"

  # DELETE
  get "/delete_baby/:id", :controller => "babies", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
