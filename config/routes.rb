Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  devise_for :users

  root to: "pages#home"

  get "/évènements/:id/chat", to: 'events#chat', as: "chat"


  get "/profil/mes-demandes", to: 'users#demandes', as: "mes-demandes"
  get "/profil/mes-évènements", to: 'users#évènements', as: "mes-evenements"


  resources :users, only: %i[show edit update], path: "profil"

  resources :events, only: %i[index show new create], path: "évènements" do
    resources :inscriptions, only: %i[create], path: "inscription"
    resources :messages, only: %i[create], path: "messages"
    resources :boardgames_lists, only: %i[create], path: "boardgames"
  end

  resources :boardgames, only: %i[index show], path: "jeux-de-société"




  # Defines the root path route ("/")
  # root "posts#index"
end
