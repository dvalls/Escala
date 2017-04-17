Rails.application.routes.draw do

  root 'home#index'

  get 'massive_up/new'
  post 'massive_up/create'

  get 'admin' => 'admin/home#index'
  get 'access/login'
  get 'login' => 'access/login'

  post 'access/attempt_login'
  get 'access/logout'

  resources :courses
  resources :feeds
  resources :tags
  resources :images
  resources :carousels
  resources :students

  resources :categories
  resources :library_files
  resources :content_blocks
  resources :content_videos
  resources :content_video_groups
  resources :content_library_groups
  resources :pages
  resources :pages do
    resources :content_blocks
  end

  resources :content_library_groups do
    resources :content_blocks
  end

  resources :content_video_groups do
    resources :content_blocks
  end

  resource :about
  resource :contact

  resources :pages do
    resources :content_blocks
  end

  resources :courses do
    resources :images
    resources :pages
  end

  resources :content_videos  do
    resources :images
  end

  resources :library_files do
    resources :images
  end

  resource :about, :contact do
    resources :images
  end

  get 'member', to: 'member#index'
  get '/member_course/:id', to: 'member#show', as: 'member_course'

  namespace :member do
    resources :students
    resources :content_videos
    resources :library_files
    resources :courses do
      resources :content_videos
      resources :library_files
    end

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

