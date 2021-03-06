Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/my_bio', to: 'pages#my_bio', as: :my_bio
  get '/my_mochies', to: 'pages#my_mochies', as: :my_mochies
  get '/tagged', to: 'snacks#tagged', as: :tagged
  get '/ui-kit', to: 'pages#uikit', as: :uikit
  get '/map', to: 'pages#user_map', as: :user_map
  get '/snacks/favorites', to: 'snacks#favorites', as: :favorites
  get '/my_trails', to: 'trails#my_trails', as: :my_trails
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show]
  resources :snack_images, except: [:new, :create]
  resources :snacks, only: [:index, :show, :new, :create] do
    member do
      patch 'favorite', to: 'snacks#favorite'
    end
    resources :snack_images, only: [:new, :create]
    resources :snack_ratings, only: [:show, :new, :create]
  end
  resources :trails do
    member do
      patch 'toggle_edit', to: 'trails#toggle_edit'
      patch 'toggle_show', to: 'trails#toggle_show'
    end
  end

end
