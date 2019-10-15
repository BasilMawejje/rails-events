Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'events#index'

  resources :events, only: [:index, :show]
  resources :event_categories, only: [:show]
  resource :cart, only: [:show] do
    put 'add/:event_id', to: 'carts#add', as: :add_to
    put 'remove/:event_id', to: 'carts#remove', as: :remove_from
    put 'remove_one/:event_id', to: 'carts#removeone', as: :remove_one
  end
  resource :charges, only: [:new, :create]
end
