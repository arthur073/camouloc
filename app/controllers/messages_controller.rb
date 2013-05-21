# -*- encoding : utf-8 -*-
class MessagesController < ApplicationController
        before_filter :require_login
        def new
                @coloc = Coloc.find(params[:coloc_id])
                #@message = @coloc.Message.build(params[:message])
                @message = Message.new
                #doit être la colocation ayant le message
                @message.coloc_id = @coloc.id
                @message.private = params[:priv]
		if @message.private == 1 
			@titre = "Nouveau message privé"
		else 
			@titre = "Nouveau message public"
		end
        end

        def create
                @message = Message.new(params[:message])
                @message.source_id = current_user.id
                @coloc = Coloc.find(@message.coloc_id)
                if @message.save
                        #utiliser un mailer pour tous les colocs
                        UserMailer.messagemail(@message,@coloc).deliver
			flash[:success] = t('flash.mesSent')
                        redirect_to @coloc
                else 
                        @coloc = Coloc.find(@message.coloc_id)
			flash[:error] = t('flash.mesKO')
                        render 'new'
                end

        end

        def destroy
                @message = Message.find(params[:id])
                @message.destroy
                flash[:success] = t('flash.mesDestr')
                redirect_to(:back)
        end

        private
        def require_login
                unless current_user
                        flash[:notice] = t('flash.reqLogin)
                        redirect_to login_path
                end
        end

end
