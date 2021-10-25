Rails.application.routes.draw do
    devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :candidates
  resources :voters
  resources :users
  resources :elections

  root 'elections#index'

  resources :elections do
    member do
      get :toggle_election_statut
      get :delete_vote
      get :end_election
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
