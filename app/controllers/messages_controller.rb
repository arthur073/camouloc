# -*- encoding : utf-8 -*-
class MessagesController < ApplicationController
        before_filter :require_login
        def new
                @coloc = Coloc.find(params[:coloc_id])
                #@message = @coloc.Message.build(params[:message])
                @message = Message.new
                #doit être la colocation ayant le message
                @message.coloc_id = @coloc.id
        end

        def create
                @message = Message.new(params[:message])
                @message.source_id = current_user.id
                if @message.save
                        #utiliser un mailer pour tous les colocs
                        redirect_to Coloc.find(@message.coloc_id)
                else 
                        @coloc = Coloc.find(@message.coloc_id)
                        render 'new'
                end

        end

        def destroy
                @message = Message.find(params[:id])
                @message.destroy
                flash[:success] = "Message supprimé."
                redirect_to(:back)
        end

        private
        def require_login
                unless current_user
                        flash[:notice] = "Vous devez vous identifier pour accéder à cette page. "
                        redirect_to login_path
                end
        end

end
