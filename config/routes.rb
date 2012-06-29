# -*- encoding : utf-8 -*-
MyColoc::Application.routes.draw do


	resources :users
	resources :depenses
	resources :trois_depenses
	resources :quatre_depenses
	resources :colocs
	resources :sessions, :only => [:new, :create, :destroy]

	match '/contact', :to => 'pages#contact'
	match '/signup', :to => 'colocs#new'
	match '/colocs/:id/edit', :to => 'colocs#edit'
	match '/signin',  :to => 'sessions#new', :as => 'login'
	match '/signout', :to => 'sessions#destroy'
	match '/about',   :to => 'pages#about'
	match '/changelog',    :to => 'pages#changelog'
	match '/tabbord/:id', :controller => 'colocs', :action => 'tabbord', :as => 'tableau_bord'
	match '/choixnbr/:id', :controller => 'colocs', :action => 'choixnbr', :as => 'choix_nbr'
	root :to => 'pages#home'

end
