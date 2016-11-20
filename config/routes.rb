Rails.application.routes.draw do

  #get 'users/new'

  #resources :project_items
  #resources :event_logs
  #resources :project_permissions
  #resources :projects
  #resources :members

  get 'welcome', to: 'welcome#index'
  #post '/welcome', to: 'welcome#sign_up'

  root :to=>'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
