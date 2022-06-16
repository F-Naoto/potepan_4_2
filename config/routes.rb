Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :rooms, except:%i[edit update destroy]do
    get :area_search, on: :collection
    get :key_search, on: :collection
  end
  resources :reservations, except:%i[edit update destroy]do
  post :confirmation, on: :collection
  end
  resources :sessions, except:%i[edit update]
  resources :users , except:%i[destroy] do 
  get :account, on: :collection
  get :profile, on: :collection
  end
end
