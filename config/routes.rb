Rails.application.routes.draw do

  root              'basic_pages#home'
  get 'services' => 'basic_pages#services'
  get 'contact'  => 'basic_pages#contact'
  get 'signup'   => 'customers#new'

  get 'signin'    => 'sessions#new'
  post 'signin'   => 'sessions#create'
  delete 'signout' => 'sessions#destroy'

  resources :customers
end
