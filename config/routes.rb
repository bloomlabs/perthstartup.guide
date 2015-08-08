Rails.application.routes.draw do
  resources :search_suggestions
  resources :companies

  root 'companies#index'

end
