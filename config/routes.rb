Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :books
    resources :chapters
    resources :decision_points
    resources :parts
    resources :genres
    resources :libraries
    resources :reviews
    resources :shelves
    resources :answers
    resources :progresses

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
    resources :reviews, except: [:index, :show]
    get 'search', on: :collection
    get 'details', on: :member
    get 'read(/:part_id)', action: :read, on: :member, as: 'read'
    match 'add_to_library', action: :add_to_library, on: :member, via: [:get, :post]
    delete 'remove_from_library', on: :member
    get 'browse', on: :collection
  end

  resources :shelves, except: [:index]
  resources :genres, only: [:index, :show]

  root to: 'home#index'
end
