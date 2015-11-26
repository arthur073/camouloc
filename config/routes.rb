# -*- encoding : utf-8 -*-
MyColoc::Application.routes.draw do
	default_url_options :host => "camouloc.kerokuapp.com"


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
	match '/contact', :to => 'pages#contact'
	match '/signup', :to => 'sessions#register'
	match '/create_users', :to => 'sessions#create_users', :as => 'create_users'
	match '/colocs/:id/edit', :to => 'colocs#edit'
	match '/signin',  :to => 'sessions#new', :as => 'login'
	match '/signout', :to => 'sessions#destroy'
	match '/about',   :to => 'pages#about'
	match '/changelog',    :to => 'pages#changelog'
	match '/partenaires',    :to => 'pages#partenaires'
	match '/plan-du-site',    :to => 'pages#plandusite', :as => 'plan'
	match '/tabbord/:id', :controller => 'colocs', :action => 'tabbord', :as => 'tableau_bord'
	match '/addexpense', :controller => 'colocs', :action => 'add_expense', :as => 'add_expense'
	match '/registerprovider', :controller => 'sessions', :action => 'register_provider', :as => "register_provider"
	get "/verifyuser" => "users#verify_user", :as => "verify_user"
	get "/verifycoloc" => "colocs#verify_coloc", :as => "verify_coloc"	
	get "/addroommate" => "users#add_roommate", :as => "add_roommmate"	
	get "/removeroommate" => "users#remove_roommate", :as => "remove_roommmate"
	post "/newexpense" => "colocs#new_expense", :as => "new_expense"
	root :to => 'pages#home'

end
