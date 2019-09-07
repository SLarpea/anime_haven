Rails.application.routes.draw do
  devise_for :users
 root 'home#index'

  resources :genres, except: :destroy

  resources :animes do
    resources :characters
  end

  resources :favorite_animes, only: [:index,:create]
end
