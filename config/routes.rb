Rails.application.routes.draw do

  devise_for :live_houses, controllers: {
    sessions: "devise/live_houses/sessions",
    registrations: "devise/live_houses/registrations"
  }

  devise_for :users, skip: [:registrations, :sessions ]

  devise_scope :user do
    get 'signin' => 'devise/users/sessions#new', as: :new_user_session
    post 'signin' => 'devise/users/sessions#create', as: :user_session
    delete 'sign_out' => 'devise/users/sessions#destroy', as: :destroy_user_session
    get 'signup' => 'devise/users/registrations#new', as: :new_user_registration
    post 'signup' => 'devise/users/registrations#create', as: :user_registration
    post 'guest_sign_in' => 'devise/users/sessions#guest_sign_in', as: :user_guest_sign
  end

  devise_for :admins, controllers: {
    sessions: "devise/admins/sessions",
    registrations: "devise/admins/registrations"
  }

  namespace :live_house do
    get 'calendar' => 'lives#calendar'
    resources :mypages, only:[:new, :show, :edit]
    resources :schedules, only:[:index]
    resources :lives, only:[:new, :create, :show]
    resources :user, only:[:show]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'home_lives' => 'homes#lives'
    resources :live_houses, only: [:index, :show]
    resources :favorites, only: [:create, :destroy]
    resources :live_organizations, only: [:create]
    resources :lives, only: [:new, :create, :show]
    get 'calendar' => 'lives#calendar'
    resources :notifications, only: :index
    resources :relationships, only: [:create, :destroy]
    resources :bands, only:[:index, :edit, :update]
    resources :articles, only:[:show, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    get 'users/:id/edit' => 'users#edit' ,as: 'edit_mypage'
    get 'users/:id' => 'users#show', as: 'mypage'
    patch 'users/mypage/update' => 'users#update'
    resources :bands do
      member do
        get :following, :followers
      end
    end
  end

  namespace :admin do
    root to: 'homes#top'
    resources :user_bands, only:[:index, :show, :update]
    resources :users, only:[:index, :show]
    resources :live_houses, only:[:edit, :show, :index, :update]
    resources :lives, only:[:index, :edit, :update]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
