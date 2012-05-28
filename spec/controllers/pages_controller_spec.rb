# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PagesController do
	render_views

	before(:each) do
		#
		# Define @base_title here.
		@base_title = "MyColoc"    
		#
	end

	describe "GET 'home'" do
		it "devrait réussir" do
			get 'home'
			response.should be_success
		end

		it "devrait avoir le bon titre" do
			get 'home'
			response.should have_selector("title",
								:content => @base_title)
		end
	end

	describe "GET 'contact'" do
		it "devrait réussir" do
			get 'contact'
			response.should be_success
		end

		it "devrait avoir le bon titre" do
			get 'contact'
			response.should have_selector("title",
								:content => @base_title)
		end
	end

	describe "GET 'about'" do
		it "devrait réussir" do
			get 'about'
			response.should be_success
		end

		it "devrait avoir le bon titre" do
			get 'about'
			response.should have_selector("title",
								:content => @base_title)
		end
	end
end
