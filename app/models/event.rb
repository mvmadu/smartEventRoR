class Event < ActiveRecord::Base
	has_many :pictures, :dependent => :destroy 

	attr_accessible :title, :start_time, :end_time, :description, :picture_attributes
end
