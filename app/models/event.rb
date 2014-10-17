class Event < ActiveRecord::Base
	belongs_to :user
	has_many :pictures, :dependent => :destroy 

	attr_accessible :title, :start_time, :end_time, :description, :picture_attributes, :user_id
end
