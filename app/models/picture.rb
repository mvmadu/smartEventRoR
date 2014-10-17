class Picture < ActiveRecord::Base
	belongs_to :event
	attr_accessible :event_id , :photo
	has_attached_file  :photo,
		:url  => "/assets/pictures/:id/:style/:basename.:extension",
    	:path => ":rails_root/public/assets/pictures/:id/:style/:basename.:extension"

	do_not_validate_attachment_file_type :photo
end
