Rails.application.routes.draw do

  get 'posts' => 'posts#index'

  get 'posts/new', as: :new_post

  get 'posts/:id' => 'posts#show', as: :post

  get 'posts/:id/edit' => 'posts#edit', as: :edit_post

  post 'posts' => 'posts#create'
  
  patch 'posts/:id' => 'posts#update'

  get 'posts/:id/delete' => 'posts#delete', as: :delete_post

  post 'posts/:post_id/comments' => 'comments#create', as: :post_comments

  patch 'posts/:post_id/comments/:comment_id' => 'comments#update', as: :post_comment

  get 'posts/:post_id/comments/:comment_id/edit' => 'comments#edit', as: :edit_comment

  get 'posts/:post_id/comments/:comment_id/delete' => 'comments#delete', as: :delete_comment


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
