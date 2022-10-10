class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_path(user.id)
    else
      redirect_to register_path
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end