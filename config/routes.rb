Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :rooms do
    get :area_search, on: :collection
    get :key_search, on: :collection
  end
  resources :reservations
  resources :sessions
  resources :users
end
