Rails.application.routes.draw do

  devise_for :users do
      get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :raffles
  resources :orders, only: [:new, :show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
