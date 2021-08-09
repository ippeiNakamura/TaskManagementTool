Rails.application.routes.draw do
  root 'tops#show'
  shallow do
    resources :users do
      resources :projects do
        resources :work_targets do
          resources :flags do
            resources :tasks do 
            end
          end
        end
      end
      resources :schedules do
        collection do
          get 'get_category_children', defaults: { format: 'json' }
          get 'get_category_grandchildren', defaults: { format: 'json' }
        end
      end
    end
  end      
  resource :session,only: [:create,:destroy]
end