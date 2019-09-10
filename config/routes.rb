Rails.application.routes.draw do
  devise_for :users
 root 'home#index'

  resources :genres, except: :destroy

  resources :animes do
    resources :characters
  end
  get 'top_favorite_animes', to: 'animes#top_favorite_animes', as: 'top_favorite_animes'

  resources :favorite_animes, only: [:index,:destroy]
  post 'favorite_animes/:anime_id', to: 'favorite_animes#create', as: 'add_favorite_anime'
end
