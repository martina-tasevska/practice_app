class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_tasks_path(user_id: @user.id)
    else
      redirect_to login_path
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id
  end

  def welcome
  end

  def logout
    session.delete(:user_id)
    redirect_to login_path
  end
end
