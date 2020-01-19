Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  get '/', to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
end
