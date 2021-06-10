Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, only: [:new,:create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :blogs, only: [:new, :create, :show, :edit ,:update ,:destroy] do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy, :show]
end
