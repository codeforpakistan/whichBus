RailsBoot::Application.routes.draw do
  #devise_for :admin
  devise_for :admin, :controllers => { :registrations => "devise/admin/registrations", :sessions => "devise/admin/sessions" }
  
 # devise_for :admins
  get "super_admin/index"
  get "super_admin/dashboard"
  get "busstop/showAll", as: :busstop_showAll
  get "busstop/index"
  get "busstop/new"
  get "busstop/view/:id", to: 'busstop#view', as: :busstop_view
  delete "busstop/:id", to: 'busstop#destroy', as: :busstop_delete
  patch "busstop/edit/:id", :to => "busstop#edit", as: :busstop_edit
  post "busstop/createBusstop"
  
  get "hello/index"
  get "route/showAllRoute"
  get "route/addRoute"
  get "route/showAll", as: :route_showAll
  get "route/view/:id", to: 'route#view', as: :route_view
  post "route/createRoute"
  get "route/new"
  patch "route/edit/:id", :to => "route#edit", as: :route_edit
  delete "route/:id", to: 'route#destroy', as: :route_delete
  
  
  
  
  #rogue lines
  
  devise_scope :admin do
    get 'admin/index', to: 'devise/admin/registrations#index', as: :admin_index
    get 'admin/pendingUser', to: 'devise/admin/registrations#pendingUser', as: :admin_pending_user
     root 'devise/admin/registrations#index'
  end
  
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
