Rails.application.routes.draw do
 root 'home#index'

  resources :genres, except: :destroy

  resources :animes do
    resources :characters
  end
end
