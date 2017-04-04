Rails.application.routes.draw do

  root 'home#index'

  get 'my_courses/index'

  get 'access/login'

  get 'admin' => 'admin/home#index'

  get 'login' => 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  get 'my_course' => 'students#my_course'

  resources :courses
  resources :feeds
  resources :tags
  resources :images
  resources :carousels
  resources :students

  resources :categories
  resources :assets
  resources :my_courses

  resource :about
  resource :contact

  resources :courses do
    resources :images
  end

  resources :assets do
    resources :images
  end

  resource :about, :contact do
    resources :images
  end

  namespace :admin do
    resources :tags
  end



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

