HangulIpsum::Application.routes.draw do

  root :to => 'home#index'
  match 'generate', :to => 'home#generate_ipsum', :via => 'get'

  resources :text_sources

end
