Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :admin do
    get 'index', as: 'panel'
  end

  resources :books do
    resources :chapters do
      resources :parts do
        resources :decision_points
      end
    end
  end

  root to: 'home#index'
end
