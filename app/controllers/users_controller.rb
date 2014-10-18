class UsersController < ApplicationController  
  skip_before_action :require_login, only: [:new,:create]

  def new
    @user = User.new
  end

  def user_events
    e=[]
    Event.all.each { |event|
      if event.user_id == current_user.id 
        e.push(event)
      end
    }
    render json :e.map(&:as_json) 
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end