# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
        skip_before_filter :require_login

        def new
                @titre = "S'identifier"
        end

        def create
                user = User.authenticate(params[:session][:email],
                                         params[:session][:password])
                if user.nil?
                        @titre = "S'identifier"
                        flash[:error] = t('flash.logKO')
			redirect_to login_path
                else
                        flash[:notice] = t('flash.logOK')  + user.nom + ". "
                        sign_in user
                        redirect_back_or user
                end
        end

        def destroy
                sign_out
                redirect_to root_path
                flash[:notice] = t('flash.logOut')
        end
end
