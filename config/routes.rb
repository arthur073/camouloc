# -*- encoding : utf-8 -*-
Demo::Application.routes.draw do

	resources :users
	resources :collocs
	resources :sessions, :only => [:new, :create, :destroy]

	match '/contact', :to => 'pages#contact'
	match '/signup', :to => 'collocs#new'
	match '/collocs', :to => 'collocs#index'
	match '/collocs/new', :to => 'collocs#new'
	match '/signin',  :to => 'sessions#new'
	match '/signout', :to => 'sessions#destroy'
	match '/about',   :to => 'pages#about'
	match '/help',    :to => 'pages#help'
	root :to => 'pages#home'


end
