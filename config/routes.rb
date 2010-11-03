Racearama::Application.routes.draw do


  resources :races

  resources :lane_assignments

  resources :heats

  resources :heat_groups

  resources :settings
  
  match 'parent' => 'parent#index'
  match 'track_manager' => 'track_manager#index'
  match 'staging' => 'staging#index'
  match 'check_in' => 'check_in#index'
  get 'check_in/new'
  get "page/welcome"
  get "page/event_not_set"


  # resources :scouts
  resources :scouts do
    member do
      get 'check_in'
      get 'check_out'
    end
  end

  resources :dens
  resources :packs
  
  resources :events do
    member do
      get "set_active"
    end
  end

  # devise_for :users
  devise_for :users, :controllers => { :sessions => "users/sessions"}

  match 'track_test' => "track_test#index"
  match 'track_test/gate_up' => "track_test#gate_up"
  match 'track_test/gate_down' => "track_test#gate_down"
  match 'track_test/test_race' => "track_test#test_race"
  match 'track_test/test_lanes' => "track_test#test_lanes"
  get "page/copyright"
  get "page/about"
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "page#welcome"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
