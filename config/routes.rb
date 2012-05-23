# -*- encoding : utf-8 -*-
Demo::Application.routes.draw do

  get "colloc/new"

	resources :users
	resources :colloc
	resources :sessions, :only => [:new, :create, :destroy]

	match '/contact', :to => 'pages#contact'
	match '/signup', :to => 'users#new'
	#match '/collocs', :to => 'colloc#show'
	match '/signin',  :to => 'sessions#new'
	match '/signout', :to => 'sessions#destroy'
	match '/about',   :to => 'pages#about'
	match '/help',    :to => 'pages#help'
	root :to => 'pages#home'


end
