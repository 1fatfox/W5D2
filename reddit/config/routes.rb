Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]
  resource :session

  resources :subs, except: [:destroy] do
    resources :posts, only: [:create, :destroy]
  end

  resources :posts, except: [:index, :create, :destroy]

  root to: 'subs#index'
end
