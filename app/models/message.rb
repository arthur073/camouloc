class Message < ActiveRecord::Base
        attr_accessible :coloc_id, :content, :private
        belongs_to :coloc
        validates :content, :presence => true, :length       => { :within => 0..140 }
end
