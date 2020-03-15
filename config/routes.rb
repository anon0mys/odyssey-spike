Rails.application.routes.draw do
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
