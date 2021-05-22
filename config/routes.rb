Rails.application.routes.draw do

  root "users#index"
  resources :users do
    resources :projects do
      resources :work_targets do
        resources :flags do
          resource :top,only: [:show]
          resources :tasks do
          end
          resources :schedules do
          end
        end
      end
    end
  end
  resource :session,only: [:create,:destroy]
end
