Rails.application.routes.draw do
  get 'tops/show'
  root "users#index"
  resources :users do
    resource :top,only: [:show]
    resources :projects
    resources :tasks
  end
  resource :session,only: [:create,:destroy]
end
