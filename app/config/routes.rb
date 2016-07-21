Rails.application.routes.draw do
  get 'project_likes/new'

  root 'pages#home' # root page

  # project members routes  
  get 'project_members/index' => 'project_members#index'
  get 'project_members/new' => 'project_members#new'
  get 'project_members/edit' => 'project_members#edit'  
  post 'project_members' => 'project_members#create'  
  #get 'project_members/edit' => => 'project_members#index'
  post 'project_members/destroy/(:id)' => 'project_members#destroy'   
	
	
	
  get 'project_milestones/new' => 'project_milestones#new'
  get 'project_milestones/index' => 'project_milestones#index'
  post 'project_milestones' => 'project_milestones#create'
  get 'project_milestones/edit' => 'project_milestones#edit'    
  post 'project_milestones/destroy/(:id)' => 'project_milestones#destroy' 

  resources :sessions, only: [:new, :create, :destroy] # only allow new,create,destroy action for sessions
  resources :users   
  resources :project_members
  resources	:project_milestones

  get 'signup' => 'users#new' # display create user page
  post'users' => 'users#create' # process creation of user  
  get 'pages/comrules' => 'pages#comrules' # display com rules
  get 'pages/term' => 'pages#term' # display terms
  get 'login' => 'sessions#new' # show login form
  post 'sessions/create' => 'sessions#create' # process login
  get 'sessions/destroy' => 'sessions#destroy' # log out and invalidate session
  get 'dashboard/index' => 'dashboards#index' # Display page upon successful login
  get 'admins/index' => 'admins#index'
  get 'users/changepass/:id' => 'users#changepass'
  get 'admins/index' => "admins#index"
   

  match '/:controller/:action/(:id)', via: [:get, :post] # last route
end
