Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'categories#index'

  # Defines the root path route ("/")
  # root "posts#index"

  resources :categories, except: [:edit, :update, :destory] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy] # because to destroy a bookmark it is independent as we don't need to know the category so it doesn't need to be nested
end
