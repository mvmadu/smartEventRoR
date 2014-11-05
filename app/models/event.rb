class Event < ActiveRecord::Base
	belongs_to :user
	has_many :pictures, :dependent => :destroy
	validate :start_must_be_before_end_time
	attr_accessible :title, :start_time, :end_time, :description, :picture_attributes, :user_id
	require "json"
	
	private
    	def start_must_be_before_end_time
    	  errors.add(:start_time, "must be before end time") unless
    	    start_time < end_time
   		end
end
