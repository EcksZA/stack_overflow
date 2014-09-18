Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'questions#index'

  resources :users, except: [:index, :edit, :update] do
    resources :questions, except: [:index]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, only: [:index]
end

