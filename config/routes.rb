Rails.application.routes.draw do
  resources :swords
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "swords#index"
  resources :swords
end