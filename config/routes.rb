Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'caraousel', to: 'pages#caraousel'
  get 'signup', to: 'users#new'
  resources :articles
  resources :users
end
