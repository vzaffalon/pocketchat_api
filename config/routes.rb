Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:index, :create]
  resources :chats, only: [:index, :create]
  resources :messages, only: [:index, :create]

end
