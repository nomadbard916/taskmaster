Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root  to: 'tasks#index'

  resources :tasks

  resources :users do
    
  end

  get '/login', to: "users#login_page"
  post '/login', to: "users#login"
  get '/logout', to: "users#logout"

  

end
