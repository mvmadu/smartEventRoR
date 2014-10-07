class Event < ActiveRecord::Base

	has_attached_file :picture_objects, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	#validates_attachment_content_type :picture_objects  , :content_type =>"image/jpeg"},
	#:size => { :in 0..50.kilobytes }
end
