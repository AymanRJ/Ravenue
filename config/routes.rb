Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :venues do 
    resources :bookings, only: [ :new, :create ]
  end
end
