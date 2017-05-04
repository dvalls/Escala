Rails.application.routes.draw do

  root 'home#index'

  get 'massive_up/new'
  post 'massive_up/create'

  get 'massive_up/texture_new', to: 'massive_up#texture_new'
  post 'massive_up/texture_create'

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
  resources :docs

  resources :content_blocks
  resources :content_videos
  resources :content_video_groups
  resources :content_library_groups
  resources :content_docs_groups

  resources :pages
  resources :pages do
    resources :content_blocks
  end

  resources :content_library_groups do
    resources :content_blocks
  end
  get '/content_library_group/:id/category/:category_id', to: 'content_library_groups#show', as: 'content_library_group_category'

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
  # get '/member_course/:id', to: 'member#show', as: 'member_course'

  namespace :member do
    resources :students
    resources :content_videos
    resources :library_files
    resources :pages
    resources :courses

    get '/member_course/:course_id/page/:page_id/content_library/:category_id', to: 'library_files#show', as: 'course_library'

    resources :courses do
      resources :content_videos
      resources :pages
    end

    resources :content_blocks do
      resources :content_library_groups do
        resources :categories
      end
    end
  end

  namespace :admin do
    resources :tags
  end
end
