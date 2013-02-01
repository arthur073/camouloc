# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

        protect_from_forgery
        include SessionsHelper

        def mobile_device?
            request.user_agent =~ /Mobile/ 
        end
        helper_method :mobile_device?


end
