Rails.application.routes.draw do
  
  
  

  root  to: 'tasks#index'

  resources :tasks do
    resources :tags, only: [:index, :create, :destroy]
    # show and new on same page, no need to update
  end

  resources :users 

  get '/login', to: "users#login_page"
  post '/login', to: "users#login"
  get '/logout', to: "users#logout"

  get '/admin', to: "admins#index"
  get '/admin/view_tasks/:id', to: "admins#view_tasks"

  
  delete '/admin/delete_task/:id', to: "admins#delete_task"

  

  

end
