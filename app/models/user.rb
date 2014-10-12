class User < ActiveRecord::Base
	attr_accessible :Name, :Email, :Password, :Password_confirmation
	validates :Name, :presence => true, :uniqueness => true
	validates :Email, email_format: { message: "doesn't look like an email address" }, :uniqueness => true
	#has_secure_password
	validates :Password, :length => {:minimum => 8}#, confirmation: true
	validates_confirmation_of :Password
	#validates :Password_confirmation, :presence => true
end
