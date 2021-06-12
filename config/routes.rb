Rails.application.routes.draw do
  resources :users, only: [:new,:create, :show,:edit,:update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :blogs, only: [:new, :create, :show, :edit ,:update ,:destroy] do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy, :show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
