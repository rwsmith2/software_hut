Rails.application.routes.draw do


  devise_for :users
  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  #root
  root to: "pages#home"

  #login/registration routes
  get "login", to: "login#index"
  get "request", to: "request#index"
  get "request_manage", to: "request_manage#index"
  get "fetch_request", to: 'request_manage#select_request', as: 'fetch_request'
  get "accept_request", to: 'request_manage#accept_request', as: 'accept_request'
  get "reject_request", to: 'request_manage#reject_request', as: 'reject_request'

  #vendor routes
  get "vendor/home" => "vendors#index"
  get "vendor_answers", to: "assessments#index"

  #admin routes
  get "admin/home", to: "admins#index"
  get "admin/management" => "admins#management"
  get "admin/admin_edit" => "admins#edit_vendor"
  get "admin/settings", to: "admins#settings"
  get "admin/tasks", to: "tasks#index"
  get "admin/tasks/assign", to: "tasks#assign"
  get "admin/given_tasks", to: "given_tasks#index"
  get "admin/assessments", to: "assessments#admin_index"
  get "admin/assessments/new", to: "assessments#new"
  get "admin/assessments/edit_question", to: "assessments#_edit_question"
  get "admin/new_vendor", to: "admins#new_vendor"
  post "admin/search_vendors", to: "admins#search_vendors"
  post "admin/create_vendor", to: "admins#create_vendor"


  #assessment routes
  get "fetch_assessment", to: 'assessments#select_assessment', as: 'fetch_assessment'
  get "assessments/questions", to: "assessments#questions"
  get "assessments/index", to: "assessments#index"
  get 'completedtasks/index', to: "completedtasks#index"
  get "assessments/triage", to: "assessments#triage"

  #task routes
  get "fetch_task", to: 'tasks#select_task', as: 'fetch_task'
  get "fetch_given_task", to: "given_tasks#select_given_task"
  get "sort_tasks", to: 'tasks#order_tasks'

  get 'change_password', to: "change_password#index"
  match 'change_password/update', to: 'change_password#update', via: [:post]

  #resources
  resources :assessments do
    resources :questions do
      resources :answers 
    end
  end

  resources :vendor_answers
  resources :vendor_uploads
  resources :vendors do
    post :search, on: :collection
  end
  resources :admins do
    resources :create_vendor, on: :collection
  end
  resources :users
  
  resources :given_tasks do
    resources :assignments 
  end
  
  resources :tasks do
    post :search, on: :collection
    resources :given_tasks 
  end

  resources :assessments do
    post :search, on: :collection
  end

  resources :given_tasks do
    post :search, on: :collection
  end
  resources :questions

  resources :request do
    post :create, on: :collection
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
