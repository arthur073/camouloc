# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
        skip_before_filter :require_login
        layout 'login'  

        def new
        end

        def create
                user = User.authenticate(params[:session][:email], params[:session][:password])
                if user.nil?
                        flash[:error] = t("main.loginfailure")
			            redirect_to login_path
                else
                        flash[:notice] = t("main.loginsuccess", :name => user.nom.capitalize)
                        sign_in user
                        redirect_back_or Coloc.find(user.coloc_id)
                end
        end
		
		def register
                @coloc = Coloc.new
				@user = User.new
		end
		
		def register_provider
				@coloc = Coloc.new
				@user = User.find(params[:user_id])
		end

        def create_users
            @user = User.find(params[:user])
			sign_in @user
            @coloc = Coloc.find(@user.coloc_id)
            @additional_user = User.new
            @min_user_id = @coloc.users.first(:order => 'created_at asc').id          
        end

        def destroy
                sign_out
                redirect_to root_path
                flash[:notice] = t("main.logout")
        end
end
