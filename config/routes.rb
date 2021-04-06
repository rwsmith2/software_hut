Rails.application.routes.draw do


  devise_for :users
  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  #match 'vendor/home', to: 'vendor#index', via: [:get, :post], as: vendor_home_page
  #match 'admin/home', to: 'admin#index', via: [:get, :post], as: vendor_home_page

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  get "vendor/home" => "vendor#index"

  root to: "pages#home"
  get "login", to: "login#index"

  get "admin/home", to: "admin#index"
  get "admin/settings", to: "admin#settings"
  
  get "admin_tasks", to: "admin_tasks#index"

  resources :vendor
  resources :admins
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
