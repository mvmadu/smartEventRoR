class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:new,:create]

	def new
	end

	def create
		authorized_user = User.authenticate(params[:username],params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			redirect_to events_path, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end
end