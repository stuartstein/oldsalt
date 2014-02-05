Oldsalt::Application.routes.draw do
  devise_for :members
  root to: 'products#index'
  
  get '/members/dashboard' => 'members#dashboard' 
  get '/members/:id/deactivate' => 'events#deactivate', as: 'deactivate'

  get '/events/dashboard' => 'events#dashboard'
  get '/events/:id/manage' => 'events#manage', as: 'manage'
  
  resources :events, :members
  
end
