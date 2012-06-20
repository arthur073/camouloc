# -*- encoding : utf-8 -*-
module UsersHelper
	def gravatar_for(user, options = { :size => 85 })
		gravatar_image_tag(user.email.downcase, :alt => user.nom,
					 :class => 'gravatar',
					 :gravatar => options)
	end

        def delete_user?
                button_to "delete", @user, :method=>:delete, :class=>:destroy
        end

end
