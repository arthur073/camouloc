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
                        flash.now[:error] = "Combinaison Email/Mot de passe invalide."
                        @titre = "S'identifier"
                        render 'new'
                else
                        flash[:notice] = "Vous êtes connecté en tant que " + user.nom + ". "
                        sign_in user
                        redirect_back_or user
                end
        end

        def destroy
                sign_out
                redirect_to root_path
                flash[:notice] = "Vous êtes déconnecté."
        end
end
