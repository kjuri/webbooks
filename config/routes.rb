Rails.application.routes.draw do
  namespace :admin do
    resources :users
resources :books
resources :chapters
resources :decision_points
resources :parts
resources :genres

    root to: "users#index"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :books do
    resources :chapters do
      resources :parts do
        resources :decision_points
      end
    end
  end

  root to: 'home#index'
end
