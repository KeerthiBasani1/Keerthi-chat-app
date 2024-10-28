Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  resources :chat_rooms do
    resources :messages, only: [:create, :index]
  end

  resources :private_messages, only: [:create]

  get '/online_status/:id', to: 'users#online_status'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
