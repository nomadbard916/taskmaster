Rails.application.routes.draw do

  root  to: 'tasks#index'

  # task paths
  resources :tasks do
    resources :tags, only: [:index, :create, :destroy]
    # show and new on same page, no need to update
  end

  # User and login paths
  resources :users 

  get '/login', to: "users#login_page"
  post '/login', to: "users#login"
  get '/logout', to: "users#logout"

  # Admin paths
  get '/admin', to: "admins#index"
  get '/admin/view_tasks/:id', to: "admins#view_tasks"
  delete '/admin/delete_task/:id', to: "admins#delete_task"

  #Search result path
  get '/search_results', to: "tasks#search_results"

  

  

end
