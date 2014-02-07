Oldsalt::Application.routes.draw do
  devise_for :members

  root to: 'products#index'
  
  get '/members/dashboard' => 'members#dashboard' 
  get '/members/:id/deactivate' => 'events#deactivate', as: 'deactivate'
  get '/members/:id' => 'members#show', as: 'member_root_path'
  
  get '/events/:id/nogo' => 'events#nogo', as: 'nogo'
  get '/events/dashboard' => 'events#dashboard'
  get '/events/:id/manage' => 'events#manage', as: 'manage'
  get '/events/:id/publish' => 'events#publish', as: 'publish'
  

  resources :events, :members
  
end
