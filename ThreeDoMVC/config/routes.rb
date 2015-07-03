Rails.application.routes.draw do

  root 'todos#index'

  resources :todos do
    member do
      post 'toggle'
    end
    collection do
      post 'destroy_all_complete'
    end
  end

  #                     Prefix Verb   URI Pattern                           Controller#Action
  #                       root GET    /                                     todos#index
  #                toggle_todo POST   /todos/:id/toggle(.:format)           todos#toggle
  # destroy_all_complete_todos POST   /todos/destroy_all_complete(.:format) todos#destroy_all_complete
  #                      todos GET    /todos(.:format)                      todos#index
  #                            POST   /todos(.:format)                      todos#create
  #                   new_todo GET    /todos/new(.:format)                  todos#new
  #                  edit_todo GET    /todos/:id/edit(.:format)             todos#edit
  #                       todo GET    /todos/:id(.:format)                  todos#show
  #                            PATCH  /todos/:id(.:format)                  todos#update
  #                            PUT    /todos/:id(.:format)                  todos#update
  #                            DELETE /todos/:id(.:format)                  todos#destroy

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
