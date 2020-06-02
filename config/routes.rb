Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages, only [:home, :dashboard] do
    resources :pets do
      resources :sittings, only [:new, :create, :show, :destroy, :edit, :update]
    end
  end
end
