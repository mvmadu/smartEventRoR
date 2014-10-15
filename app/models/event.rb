class Event < ActiveRecord::Base
	attr_accessible :title, :start_time, :end_time, :description, :pictures_attributes
	has_many :pictures
end
