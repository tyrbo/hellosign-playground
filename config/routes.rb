Rails.application.routes.draw do
  root 'templates#index'

  resources :templates
end
