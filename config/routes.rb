Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages, only: [ :home] do
    collection do
      get :dashboard
    end
  end
  resources :venues do
    resources :bookings, only: [ :create ]
  end
  resources :bookings, only: [] do
    member do
      patch :accept
      patch :reject
    end
  end
end
