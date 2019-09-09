Rails.application.routes.draw do
  devise_for :users
 root 'home#index'

  resources :genres, except: :destroy

  resources :animes do
    resources :characters
  end

  post 'favorite_animes/:anime_id', to: 'favorite_animes#create', as: 'add_favorite_anime'
end
