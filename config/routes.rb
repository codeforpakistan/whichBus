RailsBoot::Application.routes.draw do
  #devise_for :admin
  devise_for :admin, :controllers => { :registrations => "devise/admin/registrations", :sessions => "devise/admin/sessions" }
  
 # devise_for :admins
  get "super_admin/index"
  get "super_admin/dashboard"
  get "busstop/showAll", as: :busstop_showAll
  get "busstop/index"
  get "busstop/new", to: 'busstop#new', as: :busstop_new
  get "busstop/view/:id", to: 'busstop#view', as: :busstop_view
  delete "busstop/:id", to: 'busstop#destroy', as: :busstop_delete
  get "busstop/showEdit/:id", :to => "busstop#showEdit", as: :busstop_show_edit
  post "busstop/update/:id", :to => "busstop#update", as: :busstop_update
  post "busstop/createBusstop"
  
  get "route/showAllRoute"
  get "route/addRoute"
  get "route/showAll", as: :route_showAll
  get "route/view/:id", to: 'route#view', as: :route_view
  post "route/createRoute"
  get "route/new", as: :route_new
  get 'route/editRouteProperties/:id', :to => 'route#editRouteProperties', as: :route_edit_route_properties
  post "route/update/:id", :to => "route#update", as: :route_update
  delete "route/:id", to: 'route#destroy', as: :route_delete
  get 'route/showEditRoute/:id', to: 'route#showEditRoute', as: :route_show_edit_route
  get "route/routeDetails/:id", to: 'route#routeDetails', as: :route_route_details
  
  post 'route/removeRouteBusstop/:id', to: 'route#removeRouteBusstop', as: :route_remove_route_busstop 
  post 'route/includeRouteBusstop/:id', to: 'route#includeRouteBusstop', as: :route_include_route_busstop 
  get 'welcome', to: 'welcome#welcome', as: :welcome_welcome
  
  #rogue lines
  
  #
  
  devise_scope :admin do

    get 'admin/index', to: 'devise/admin/registrations#index', as: :admin_index
    get 'admin/pendingUser', to: 'devise/admin/registrations#pendingUser', as: :admin_pending_user
    root 'devise/admin/registrations#welcome'
    post 'admin/approveUser/:id', to: 'devise/admin/registrations#approveUser', as: :admin_approve_user
    post 'admin/approveAdmin/:id', to: 'devise/admin/registrations#approveAdmin', as: :admin_approve_admin 
    get 'unApprovedAccount', to: 'devise/admin/registrations#unApprovedAdmin', as: :admin_unapproved_account  
    get "company/index", as: :company_index
    get "company/showAll", as: :company_showAll
    get 'company/routeDetails/:id', to: 'company#routeDetails', as: :company_route_details
    post "company/addCompanyRoute/:id", to: 'company#addCompanyRoute', as: :company_include_company_route
    post "company/removeCompanyRoute/:id", to: 'company#removeCompanyRoute', as: :company_remove_company_route
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
