Rails.application.routes.draw do

  #　ｕｓｅｒ　ａｌｒｅａｄｙ　ｈａｖｅ　ａ　ａｃｃｏｕｎｔ，　ｔｈｅｎ　ｌｏｇｉｎ
  get 'welcome/index'
  post 'welcome/create'
  # ＵＳＥＲ　ｆｉｒｓｔ　ｔｉｍｅ　ｌｏｇｉｎ　ｐａｇｅ
  get 'welcome/new_index'
  # get 'restaurants/restaurant'
  get 'welcome/exercise'

  # login page
  root 'sessions#new'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get '/increase', to: redirect('https://www.trifectanutrition.com/paleo-meal-delivery'), as: :increase
  get '/decrease', to: redirect('https://www.trifectanutrition.com/vegetarian-meal-delivery'), as: :decrease
  get '/maintain', to: redirect('https://www.trifectanutrition.com/clean-eating-meal-delivery'), as: :maintain

  resources :users
  resources :sessions, only: [:new, :destroy, :create]
  resources :restaurants
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
