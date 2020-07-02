Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: %i[show new create] do
    resources :doses, only: %i[new create show]
    resources :reviews, only: %i[new create]
  end
  resources :doses, only: %i[destroy]
  resources :reviews, only: %i[destroy]
end
