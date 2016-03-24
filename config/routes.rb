Rails.application.routes.draw do

  # get 'transactions/new', controller: "transactions#"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  
  resources :users do
  resources :bookings
  end
  
  resources :listings do

  resources :bookings
  end

  resources :transactions, only: [:new, :create]

   root 'home#index'
   #root 'users#new'
   get 'auth/facebook/callback' => 'session#create'

   get '/confirm' => 'email_confirmations#update'
   
  
end
