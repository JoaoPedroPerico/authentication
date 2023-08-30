Rails.application.routes.draw do
  get 'dashboards/index', as: :dashboards
  resources :logins, only: [:new, :create]
  resources :registrations, only: [:new, :create]
  resources :posts, only: [:new, :create, :show, :edit, :update]
end
