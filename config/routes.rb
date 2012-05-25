# -*- encoding : utf-8 -*-
Demo::Application.routes.draw do

	resources :users
	resources :colocs
	resources :sessions, :only => [:new, :create, :destroy]

	match '/contact', :to => 'pages#contact'
	match '/signup', :to => 'colocs#new'
	match '/colocs', :to => 'colocs#index'
	match '/colocs/new', :to => 'colocs#new'
	match '/signin',  :to => 'sessions#new'
	match '/signout', :to => 'sessions#destroy'
	match '/about',   :to => 'pages#about'
	match '/help',    :to => 'pages#help'
	root :to => 'pages#home'


end
