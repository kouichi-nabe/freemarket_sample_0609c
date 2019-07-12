Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get "sell" => "exhibition#index"
  post "create" => "exhibition#create"
end
