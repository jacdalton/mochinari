Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/ui-kit', to: 'pages#uikit', as: :uikit
  get '/snacks/favorites', to: 'snacks#favorites', as: :favorites
  get '/my_trails', to: 'trails#my_trails', as: :my_trails
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show]
  resources :snack_images, except: [:new, :create]
  resources :snacks, only: [:index, :show, :new, :create] do
    resources :snack_images, only: [:new, :create]
    resources :snack_ratings, only: [:show, :new, :create]
  end
  resources :trails

end
