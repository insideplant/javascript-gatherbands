Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :live_houses, only: [:index, :show, :new, :edit]
    resources :favorites, only: [:create, :destroy]
    resources :live_organizations, only: [:index, :create, :show, :edit, :update]
    resources :lives
    resources :bands, only:[:index, :show, :edit, :update] do
      resources :members, only:[:show, :edit, :update, :create]
    end
    resources :articles do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
    get 'users/mypage' => 'users#show'
    get 'users/mypage/edit' => 'users#edit'
    get 'users/confirmation' => 'users#is_active'
    patch 'users/mypage/update' => 'users#update'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only:[:index, :show, :edit, :update]
    resources :user_bands, only:[:index, :show, :update]
    resources :users, only:[:index, :show, :edit, :update]
    resources :live_houses
  end


end
