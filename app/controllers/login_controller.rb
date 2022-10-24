class LoginController < ApplicationController

  def index

  end

  def create
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:alert] = "Welcome back, #{user.username}!"
    else
      flash[:alert] = "Incorrect password, please try again"
      render :index
    end
  end
end