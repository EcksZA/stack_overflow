Rails.application.routes.draw do
  root to: 'questions#index'
  resources :users, except: [:index, :edit, :update]
  resources :sessions
end
