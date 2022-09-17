Rails.application.routes.draw do
  resources :kit_instances, only: [ :create, :update, :destroy ]
  resources :materials
  resources :kits
  resources :source_materials
  resources :kit_scales
  resources :kit_lines
  resources :producers
  resources :designers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
