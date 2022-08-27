Rails.application.routes.draw do
  devise_for :admins
  get '/contests', to: 'contests#index'
  get '/contests/new', to: 'contests#new', as: 'new_contest'
  get '/contests/:id', to: 'contests#show', as: 'contest'
  post '/contests', to: 'contests#create'

  get '/admin/contests', to: 'admin#index'
  get '/admin/contests/:id/edit', to: 'admin#edit', as: 'admin_edit_contest'
  patch '/admin/contests/:id', to: 'admin#update', as: 'admin_update_contest'
  delete '/admin/contests/:id', to: 'admin#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "contests#index"
end
