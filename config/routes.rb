Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    resources :projects do
      resources :work_targets do
        resources :flags do
          resource :top,only: [:show]
          resources :tasks do
          end
          resources :schedules do
              collection do
                get 'get_category_children', defaults: { format: 'json' }
                get 'get_category_grandchildren', defaults: { format: 'json' }
              end
          #get 'ajax',to: 'schedules#ajax'
          end
        end
      end
    end
  end

  resource :session,only: [:create,:destroy]
end