Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  #To do custom routes on resourced routes, use except then configure under
  #except expects an array
  resources :portfolios, except: [:show] 
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio-singular'
  get 'portfolios/angular-items', to: 'portfolios#angular'

  #get 'pages/about' | Below is how you map without pages/about
  get 'about-me', to: 'pages#about' #controller on the left side, action on the right side of hash
  #get 'pages/contact'
  get 'contact', to: 'pages#contact' #'contact' could be name ANYTHING. so long as pages#contact is intact

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #sets root to home. Basically changing your homepage to home
  root to: 'pages#home'

  #Custom route for blogs/:id/toggle_status
  resources :blogs do
    member do
      get :toggle_status
    end
  end


end
