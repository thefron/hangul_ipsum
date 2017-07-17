Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, defaults: { format: :json } do
    resource :generator, only: :create
  end

  resources :text_sources
end
