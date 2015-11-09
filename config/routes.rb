Rails.application.routes.draw do
  get 'entry_reviewers/new'

  resources :entries do
    resources :entry_reviewers
    member do
      get :notify_reviewers
    end
  end
  devise_for :users
  root "entries#index"
end
