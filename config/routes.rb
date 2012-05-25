# -*- encoding : utf-8 -*-
Demo::Application.routes.draw do


	resources :users
	resources :depenses
	resources :colocs
	resources :sessions, :only => [:new, :create, :destroy]

	match '/contact', :to => 'pages#contact'
	match '/signup', :to => 'colocs#new'
	match '/signin',  :to => 'sessions#new'
	match '/signout', :to => 'sessions#destroy'
	match '/about',   :to => 'pages#about'
	match '/help',    :to => 'pages#help'
	match '/tabbord/:id/tabbord', :controller => 'colocs', :action => 'tabbord', :as => 'tableau_bord'
	root :to => 'pages#home'


end
