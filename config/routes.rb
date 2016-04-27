Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'services/new'

  root              'basic_pages#home'
  get 'contact'  => 'basic_pages#contact'
  get 'signup'   => 'customers#new'

  get 'signin'    => 'sessions#new'
  post 'signin'   => 'sessions#create'
  delete 'signout' => 'sessions#destroy'

  get 'servicerequest'  => 'issues#new'

  get 'addservice' => 'services#new'

  resources :customers
  resources :account_activations, only: [:edit]
  resources :issues
  resources :services
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
end
