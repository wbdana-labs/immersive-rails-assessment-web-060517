Rails.application.routes.draw do
  # patch '/guests/:id', to: 'guests#show'
  get '/guests/add_episode', to: 'guests#add_episode', as: 'add_episode'
  patch '/guests/:id', to: 'guests#create_appearance', as: 'create_appearance'
  resources :guest_episodes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guests, only: [:index, :show]
  resources :episodes, only: [:index, :show]
end
