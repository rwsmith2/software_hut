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

  get "vendor/home" => "vendors#index"

  
  get "login", to: "login#index"
  get "request", to: "request#index"

  get "admin/home", to: "admins#index"

  get "admin/management" => "admins#management"
  get "admin/admin_edit" => "admins#edit_vendor"

  get "admin/settings", to: "admins#settings"
  
  get "admin/tasks", to: "tasks#index"

  get "admin/assessments", to: "assessments#admin_index"

  #delete 'admin/assessments/:id', to: "assessments#destroy"

  get "admin/assessments/new", to: "assessments#new"
  get "admin/assessments/edit_question", to: "assessments#_edit_question"


  get "fetch_assessment", to: 'assessments#select_assessment', as: 'fetch_assessment'
  get "fetch_task", to: 'tasks#select_task', as: 'fetch_task'


  get "assessments/questions", to: "assessments#questions"

  get "assessments/index", to: "assessments#index"
  get 'completedtasks/index', to: "completedtasks#index"

  root to: "pages#home"

  resources :assessments do
    resources :questions do
      resources :answers 
    end
  end

  resources :vendors
  resources :admins
  resources :users
  
  resources :tasks do
    post :search, on: :collection
  end

  resources :assessments do
    post :search, on: :collection
  end
  resources :questions

  resources :request do
    post :create, on: :collection
  end

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
