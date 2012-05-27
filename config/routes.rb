# -*- encoding : utf-8 -*-
MyColoc::Application.routes.draw do


	resources :users
	resources :depenses
	resources :colocs
	resources :sessions, :only => [:new, :create, :destroy]

	match '/contact', :to => 'pages#contact'
	match '/signup', :to => 'colocs#new'
	#match '/users/new/:coloc_id', :to => 'users#new'
	#match '/depenses/new/:destinataire_id', :to => 'depenses#new'
	match '/signin',  :to => 'sessions#new'
	match '/signout', :to => 'sessions#destroy'
	match '/about',   :to => 'pages#about'
	match '/changelog',    :to => 'pages#changelog'
	match '/tabbord/:id/tabbord', :controller => 'colocs', :action => 'tabbord', :as => 'tableau_bord'
	root :to => 'pages#home'

	# permet d'utiliser Heroku
	break if ARGV.join.include? 'assets:precompile'

end
