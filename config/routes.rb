Rails.application.routes.draw do
  get 'purchase/index'
  get 'logout/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'items#index'

  get "itemdetail", to: "itemdetails#index"

  get 'sell/child', to: 'categories#child'
  get 'child', to: 'categories#child'
  get 'sell/grand', to: 'categories#grand'
  get 'grand', to: 'categories#grand'

  get "sell" => "exhibition#index"
  post "create" => "exhibition#create"

  get 'signups/address' , to: 'signups#address'
  get 'signups/complete' , to: 'signups#complete'
  patch 'signup/address/create' , to: 'signups#address_create'
  get '/users/:user_id/signups/new', to: 'users/signups#sms_send'
  post '/users/:user_id/signups/new', to: 'users/signups#sms_send'
  get 'signup/sms_confirmation' => 'signups#sms_send'
  post 'signup/sms_authenticate' , to: 'signups#sms_authenticate'
  get 'signup/google' , to: 'signups#oauth_google'
  get 'signup/facebook' , to: 'signups#oauth_facebook'
  devise_scope :user do
    get "sign_in", to: "users/signups#sms_send"
    get "sign_out", to: "users/sessions#destroy"
    post 'signup/sms_confirmation' => 'signups#sms_send'
  end
  resources :purchases, only: :new
  resources :users, only: [:new, :index] do
    resources :cards, only: [:index, :new, :destroy, :show] do
      collection do
        get 'add', to: 'cards#add'
        post 'pay', to: 'cards#pay'
      end
    end
    resources :user_profiles, only: [:new, :create, :edit, :update]
    resources :user_confirmations, only: [:create, :edit, :update]
    resources :logouts, only: :index
  end
  resources :cards, only: [:new, :show] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
    end
  end
end
