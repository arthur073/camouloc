# -*- encoding : utf-8 -*-
MyColoc::Application.routes.draw do



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
	match '/contact', :to => 'pages#contact'
	match '/signup', :to => 'sessions#register'
	match '/colocs/:id/edit', :to => 'colocs#edit'
	match '/signin',  :to => 'sessions#new', :as => 'login'
	match '/signout', :to => 'sessions#destroy'
	match '/about',   :to => 'pages#about'
	match '/changelog',    :to => 'pages#changelog'
	match '/partenaires',    :to => 'pages#partenaires'
	match '/plan-du-site',    :to => 'pages#plandusite', :as => 'plan'
	match '/tabbord/:id', :controller => 'colocs', :action => 'tabbord', :as => 'tableau_bord'
	match '/list', :controller => 'colocs', :action => 'list'
	match '/choixnbr/:id', :controller => 'colocs', :action => 'choixnbr', :as => 'choix_nbr'
	get "/verifyuser" => "users#verify_user", :as => "verify_user"
	get "/verifycoloc" => "colocs#verify_coloc", :as => "verify_coloc"
	root :to => 'pages#home'

end
