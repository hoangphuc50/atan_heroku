AtanSolutionsWebsite::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  #root to: 'admin/users#index'
  # Admin routes
  #match '/admin' => 'admin/dashboard#index', :as => :admin_dashboard
  namespace :admin do
    root to: 'dashboard#index'
    resources :users
    resources :languages
    resources :articles
    resources :categories
    resources :category_languages
    resources :sessions
    resources :dashboard
    resources :articles
    resources :article_languages
    match '/lostpassword',  to: 'sessions#lostpassword',         via: 'get'
    match '/lostpassword',  to: 'sessions#sendlostpassword',         via: 'post'
    match '/signin',  to: 'sessions#new',         via: 'get'
    match '/signout', to: 'sessions#destroy',     via: 'delete'
    match '/change_password',  to: 'profiles#index',         via: 'get'
    match '/update_password',  to: 'profiles#update_password',   via: 'get'

  end
  root :to => 'home#index'
  get '/about_us' => 'home#about_us'
  get '/services' => 'home#services'
  get 'service/:id' => 'home#service'
  resources :service
  get '/news' => 'home#news'
  get 'news/:id' => 'home#news'
  get '/projects' => 'home#projects'
  get 'projects/:id' => 'home#projects'
  resources :projects
  get 'project/:id' => 'home#project'
  get 'project/:id/purchase' => 'home#project', as: :categories
  resources :project
  get 'article/:id' => 'home#article'
  resources :article
  get '/contact' => 'contacts#new'
  resources :contacts, :only => [:new, :create] do
    get 'thank_you', :on => :collection
  end
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
