# -*- encoding : utf-8 -*-
module UsersHelper
	def gravatar_for(user, options = { :size => 85 })
		image_tag("../unknown.jpg", :alt => "unknown", :class => "imgframe", :size => "100x100")
	end

	def small_gravatar_for(user, options = { :size => 85 })
		image_tag("../unknownInv.jpg", :alt => "unknown", :class => "imgframeSmall", :size => "80x80")
	end

	def aligned_gravatar_for(user)
		if user.has_image 
			image_tag (user.image) , :size => "90x90", :class => "imgframe" 
		else 
			image_tag("../unknownInv.jpg", :alt => "unknown", :class => "imgframeAligned", :size => "90x90")
		end  
	end


	def delete_user?
		button_to "delete", @user, :method=>:delete, :class=>:destroy
	end

end
