Rails.application.routes.draw do
 root 'home#index'

  resources :genres, except: :destroy

  resources :animes
end
