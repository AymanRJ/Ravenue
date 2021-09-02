Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages, only: [ :home] do
    collection do
      get :dashboard
    end
  end
  resources :venues do 
    resources :bookings, only: [ :new, :create ]
  end
end
