Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'items#index'
  get 'signups/address' , to: 'signups#address'
  get 'signups/complete' , to: 'signups#complete'
  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
    get "sign_out", to: "users/sessions#destroy"
  end
  resources :users, only: :new do
    resources :cards, only: [:index, :new, :edit, :show]
    resources :user_profiles, only: [:new, :create, :edit, :update]
    resources :user_confirmations, only: [:create, :edit, :update]
    resources :logouts, only: :new
    resources :signups, only: [:index, :new, :show]
  end
end
