Rails.application.routes.draw do
  get 'themes/show'
  get 'themes/new'
  get 'themes/create'
  get 'themes/edit'
  get 'themes/update'
  get 'themes/destroy'
  namespace :dashboard do
    resources :links
    resources :landing_pages, only: [:edit, :update]
  end
  resources :themes
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/u/:id', to: 'landing_pages#show', as: :landing_page_public

end
