Rails.application.routes.draw do
  devise_for :users
  root to: 'socks#index'
  get '/socks/drawer', to: 'socks#drawer'
  patch '/requests/:id/accept', to: 'requests#accept', as: 'accept_request'
  patch '/requests/:id/reject', to: 'requests#reject', as: 'reject_request'
  resources :socks do
    resources :requests, only: [:create, :new]
  end
  resources :requests, only: [:index, :show, :edit, :udpate, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
