Rails.application.routes.draw do
  resources :entries
  devise_for :users
  root "entries#index"
end
