Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  namespace :api, defaults: { format: :json } do
    resource :generator, only: :create
  end
  resources :text_sources
end
