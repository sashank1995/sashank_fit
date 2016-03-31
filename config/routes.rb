Rails.application.routes.draw do
  devise_for :patients
  devise_for :doctors

  get 'symptoms/new', to: 'symptoms#new', as: :new_symptom
  root 'diseases#index'
  get 'diseases/new', to: 'diseases#new', as: :new_disease
  get 'diseases/:id', to: 'diseases#show', as: :show_disease
  post '/diseases', to: 'diseases#create', as: :create_disease
  get 'diseases/:id/treatments/new', to: 'treatments#new', as: :new_treatment
  post 'diseases/:id/treatments', to: 'treatments#create', as: :create_treatment
  get 'diseases/:id/treatments/:id/edit', to: 'treatments#edit', as: :edit_treatment
  patch 'diseases/:id/treatments/:id', to: 'treatments#update', as: :update_treatment
  delete 'diseases/:id/treatments/:id', to: 'treatments#destroy', as: :destroy_treatment

  #resources :diseases do
   # resource :treatments, except: [:destroy]
  #end

  #resources :treatments, only: [:destroy]
  #get 'diseases/show'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
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