# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @image_url_hash = MoviesFacade.images(@user.movie_ids)
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = User.new(user_params)
      if user.save
        redirect_to user_path(user.id)
        flash[:alert] = "Welcome #{user.username}!"
      else
        redirect_to register_path
        flash[:alert] = "Error: #{error_message(user.errors)}"
      end
    else
      redirect_to register_path
      flash[:alert] = "Error: Passwords do not match"
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
