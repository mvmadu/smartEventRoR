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
      #UserNotifier.send_signup_email(@user).deliver
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def destroy
    if current_user
      user = current_user
      session[:user_id] = nil
      user.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end
end