class Event < ActiveRecord::Base

	has_attached_file  :picture_objects, :styles => { :medium => '300x300' }
	validates_attachment_content_type :picture_objects  , :content_type => ['image/jpeg', 'image/png']
	#:size => { :in 0..50.kilobytes }
end
