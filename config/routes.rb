# -*- encoding : utf-8 -*-
MyColoc::Application.routes.draw do
	default_url_options :host => "http://camouloc.herokuapp.com"
	# rescue error 404	
	resources :users
	resources :authentifications
	resources :depenses
	resources :trois_depenses
	resources :quatre_depenses
	resources :expenses
	resources :colocs
	resources :messages
	resources :sessions, :only => [:new, :create, :destroy]
	resources :password_resets

	match '/auth/:provider/callback' => 'authentifications#create'
	match '/auth/failure', :to => 'authentifications#failure'
	match '/signup', :to => 'sessions#register'
	match '/create_users', :to => 'sessions#create_users', :as => 'create_users'
	match '/colocs/:id/edit', :to => 'colocs#edit'
	match '/signin',  :to => 'sessions#new', :as => 'login'
	match '/signout', :to => 'sessions#destroy'
	match '/redirecttoexpensescreen', :controller => 'colocs', :action => 'redirect_to_expense_screen', :as => 'redirect_to_expense_screen'
	match '/registerprovider', :controller => 'sessions', :action => 'register_provider', :as => "register_provider"
	get "/verifyuser" => "users#verify_user", :as => "verify_user"
	get "/verifycoloc" => "colocs#verify_coloc", :as => "verify_coloc"	
	get "/addroommate" => "users#add_roommate", :as => "add_roommmate"	
	get "/removeroommate" => "users#remove_roommate", :as => "remove_roommmate"
	get "/resetcounters" => "colocs#reset_counters", :as => "reset_counters"
	post "/saveexpense" => "colocs#save_expense", :as => "save_expense"
	root :to => 'pages#home'
	match '*unmatched_route', :to => 'application#not_found'	
end
