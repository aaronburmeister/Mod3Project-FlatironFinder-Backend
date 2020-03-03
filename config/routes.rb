Rails.application.routes.draw do
  # resources :user_frameworks
  # resources :user_languages
  resources :users
  resources :frameworks
  resources :languages

  post 'login', to: 'authentication#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
