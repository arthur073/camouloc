# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

        protect_from_forgery
        include SessionsHelper

        before_filter :prepare_for_mobile

        def mobile_device?
            request.user_agent =~ /Mobile/ 
        end
        helper_method :mobile_device?

        def prepare_for_mobile
           request.format = :mobile if mobile_device?
        end

end
