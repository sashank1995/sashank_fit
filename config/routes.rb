Rails.application.routes.draw do
  devise_for :patients
  devise_for :doctors

  root 'diseases#index'
  get 'diseases/:id/comments', to: 'comments#index', as: :comments
  get 'interactions', to: 'interactions#index', as: :interactions

  get 'diseases/new', to: 'diseases#new', as: :new_disease
  get 'diseases/:disease_id/symptoms/new', to: 'symptoms#new', as: :new_symptom
  get 'diseases/:disease_id/treatments/new', to: 'treatments#new', as: :new_treatment

  post '/diseases', to: 'diseases#create', as: :create_disease
  post 'diseases/:disease_id/treatments', to: 'treatments#create', as: :create_treatment
  post 'diseases/:disease_id/symptoms', to: 'symptoms#create', as: :create_symptom
  post 'interactions/', to: 'interactions#create', as: :create_interaction
  get 'diseases/:disease_id', to: 'diseases#show', as: :show_disease
  get 'diseases/:disease_id/treatments/:id', to: 'treatments#show', as: :show_treatment
  get 'diseases/:disease_id/comments/:id', to: 'comments#show', as: :show_comment

  get 'diseases/:disease_id/treatments/:id/edit', to: 'treatments#edit', as: :edit_treatment

  patch 'diseases/:disease_id/treatments/:id', to: 'treatments#update', as: :update_treatment

  delete 'diseases/:disease_id/treatments/:id', to: 'treatments#destroy', as: :destroy_treatment
  delete 'diseases/:disease_id/symptoms/:id', to: 'symptoms#destroy', as: :destroy_symptom

  post 'diseases/:id/comments', to: 'comments#create', as: :create_comment


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
