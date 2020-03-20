Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  get '/', to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'

  resources :stories do
    resources :plot_points
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post 'login', to: 'sessions#create'
      resources :stories do
        get 'graph', to: 'graph#show'
        resources :plot_points
        resources :plot_paths
      end
    end
  end
end
