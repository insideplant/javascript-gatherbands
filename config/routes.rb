Rails.application.routes.draw do

  devise_for :live_houses

  devise_for :users, controllers: {
    sessions: "devise/users/sessions",
    registrations: "devise/users/registrations"
  }

  devise_for :admins, controllers: {
    sessions: "devise/admins/sessions",
    registrations: "devise/admins/registrations"
  }

  namespace :live_house do
    root to: 'homes#top'
    resources :mypages, only:[:new, :show, :edit]
    resources :scadules, only:[:index, :show]
    resources :lives, only:[:new, :create, :edit, :update, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'lives/index'
    get 'lives/show'
    resources :live_houses, only: [:index, :show, :new, :edit]
    resources :favorites, only: [:create, :destroy]
    resources :live_organizations, only: [:index, :create, :show, :edit, :update]
    resources :lives
    get 'calendar' => 'lives#calendar'
    get 'lives/:id/selecthouse' => 'lives#selecthouse' ,as: "selecthouse"

    resources :relationships, only: [:create, :destroy]
    resources :bands, only:[:index, :edit, :update] do
      resources :members, only:[:show, :edit, :update, :create]
    end
    resources :articles do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create]
    end

    get 'users/:id/edit' => 'users#edit' ,as: 'edit_mypage'
    get 'users/:id' => 'users#show', as: 'mypage'
    get 'users/confirmation' => 'users#is_active'
    patch 'users/mypage/update' => 'users#update'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only:[:index, :show, :edit, :update]
    resources :user_bands, only:[:index, :show, :update]
    resources :users, only:[:index, :show, :edit, :update]
    resources :live_houses
    resources :lives, only:[:index, :show]
  end


end
