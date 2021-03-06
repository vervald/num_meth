Rails.application.routes.draw do

  get 'laba3/index'

  get 'laba3_controller/index'

  root 'laba3#index'
  get 'laba1' => 'laba1#index'
  get 'laba2' => 'laba2#index'

  get 'solver/qr' => 'solver#do_qr'
  get 'solver/krilov' => 'solver#do_krilov'
  get 'solver/gen_matrix' => 'solver#gen_matrix'
  get 'solver/package_qr' => 'solver#do_package_qr'
  get 'solver/package_krilov' => 'solver#do_package_krilov'
  get 'solver/straight' => 'solver#do_straight_interpolation'
  get 'solver/reverse' => 'solver#do_reverse_interpolation'
  get 'solver/adams' => 'solver#do_adams'
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
