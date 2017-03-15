Rails.application.routes.draw do
  
  root 'dashboard#index'
    
  namespace :api do
    resources :events, only: [:new, :create, :show]
    
    resources :skills, only: [:index, :show] do
      get :filter, on: :collection
    end
    
    resources :routines, only: [:new, :create, :index]
  end

  # move event_name onto skill
  # MANY skills by 'deductions', with appropriate value

  # 'Skill#filter' filter skills on 'event_name'
  #   'Skill#search' search within form for specific skill based on deductions selected (function as binary search form)
  #   'Skill#show' action => Box to right of skill demo in React. (already set up....)
  #   'Event#create' action => choose/search for skill => one by one, form for ADDING skill_id and routine_id to association table
  #   'Routine#show / Skill#index' React => get 'index' of skills on routine.skills => update list

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
