class Event < ActiveRecord::Base
	has_attached_file  :picture_objects,
	:url  => "/assets/events/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"
	validates_attachment_content_type :picture_objects, :content_type => ['image/jpeg', 'image/png'] 

end
