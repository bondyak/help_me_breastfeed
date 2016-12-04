Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "babies#index"
  # Routes for the Resource resource:
  # CREATE
  get "/resources/new", :controller => "resources", :action => "new"
  post "/create_resource", :controller => "resources", :action => "create"

  # READ
  get "/resources", :controller => "resources", :action => "index"
  get "/resources/:id", :controller => "resources", :action => "show"

  # UPDATE
  get "/resources/:id/edit", :controller => "resources", :action => "edit"
  post "/update_resource/:id", :controller => "resources", :action => "update"

  # DELETE
  get "/delete_resource/:id", :controller => "resources", :action => "destroy"
  #------------------------------

  # Routes for the Issue resource:
  # CREATE
  get "/issues/new", :controller => "issues", :action => "new"
  post "/create_issue", :controller => "issues", :action => "create"

  # READ
  get "/issues", :controller => "issues", :action => "index"
  get "/issues/:id", :controller => "issues", :action => "show"

  # UPDATE
  get "/issues/:id/edit", :controller => "issues", :action => "edit"
  post "/update_issue/:id", :controller => "issues", :action => "update"

  # DELETE
  get "/delete_issue/:id", :controller => "issues", :action => "destroy"
  #------------------------------

  # Routes for the Tip resource:
  # CREATE
  get "/tips/new", :controller => "tips", :action => "new"
  post "/create_tip", :controller => "tips", :action => "create"

  # READ
  get "/tips", :controller => "tips", :action => "index"
  get "/tips/:id", :controller => "tips", :action => "show"

  # UPDATE
  get "/tips/:id/edit", :controller => "tips", :action => "edit"
  post "/update_tip/:id", :controller => "tips", :action => "update"

  # DELETE
  get "/delete_tip/:id", :controller => "tips", :action => "destroy"
  #------------------------------

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
