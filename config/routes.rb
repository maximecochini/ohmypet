Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages
  resources :pets do
    resources :sittings, only [:new, :create]
    end
  resources :sittings, only [:destroy, :edit, :update, :show]
end
