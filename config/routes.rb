Rails.application.routes.draw do
  get 'admins/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root  to: 'tasks#index'

  resources :tasks

  resources :users

  get '/login', to: "users#login_page"
  post '/login', to: "users#login"
  get '/logout', to: "users#logout"

  get '/admin', to: "admins#index"
  get '/admin/view_tasks/:id', to: "admins#view_tasks"

  
  delete '/admin/delete_task/:id', to: "admins#delete_task"

  

end
