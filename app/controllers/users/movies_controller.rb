class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated]
      @movies = MoviesFacade.top_rated
    elsif params[:search]
      @movies = MoviesFacade.search(params[:search])
    end

    def show
      
    end
  end