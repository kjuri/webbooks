Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :admin do
    get 'index', as: 'panel'
  end

  namespace :writer do
    get 'index', as: 'panel'
  end

  namespace :reader do
    get 'index', as: 'panel'
  end

  root to: 'home#index'
end
