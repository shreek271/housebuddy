Rails.application.routes.draw do

  get 'customers/new'

  root              'basic_pages#home'
  get 'services' => 'basic_pages#services'
  get 'contact'  => 'basic_pages#contact'
  get 'signin'   => 'basic_pages#signin'
  get 'signup'   => 'customers#new'

end
