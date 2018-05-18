Rails.application.routes.draw do
  resources :portfolios

  #get 'pages/about' | Below is how you map without pages/about
  get 'about-me', to: 'pages#about' #controller on the left side, action on the right side of hash
  #get 'pages/contact'
  get 'contact', to: 'pages#contact' #'contact' could be name ANYTHING. so long as pages#contact is intact

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #sets root to home. Basically changing your homepage to home
  root to: 'pages#home'

end
