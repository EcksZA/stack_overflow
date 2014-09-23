Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'questions#index'

  resources :users, except: [:index, :edit, :update]
  resources :questions, except: [:index] do
    resources :answers, except: [:index, :show] do
      resources :votes, only: [:create]
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :search, only: [:index]
end

