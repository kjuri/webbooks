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
    resources :reviews, except: [:show]
    get 'read', on: :member
    get 'add_to_library', on: :member
    get 'remove_from_library', on: :member
    get 'browse', on: :collection
  end

  resources :shelves, except: [:index]

  root to: 'home#index'
end
