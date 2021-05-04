Rails.application.routes.draw do
  root "users#index"
  resources :users do
    resources :projects do
      resources :work_targets do
        resource :top,only: [:show]
          resources :flags do
            resources :tasks do
            end
          end
      end
    end
  end
  resource :session,only: [:create,:destroy]
end
