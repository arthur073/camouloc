# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
        skip_before_filter :require_login
        layout 'login'  

        def new
        end

        def create
                user = User.authenticate(params[:session][:email], params[:session][:password])
                if user.nil?
                        @titre = "S'identifier"
                        flash[:error] = t('flash.logKO')
			            redirect_to login_path
                else
                        flash[:notice] = t('flash.logOK')  + user.nom + ". "
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
            @coloc = Coloc.find(@user.coloc_id)
            @additional_user = User.new
        end

        def destroy
                sign_out
                redirect_to root_path
                flash[:notice] = t('flash.logOut')
        end
end
