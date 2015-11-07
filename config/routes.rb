Rails.application.routes.draw do
  resources :entries do
    resources :reviewer_entries
    member do
      get :notify_reviewers
    end
  end
  devise_for :users
  root "entries#index"
end
