class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @user = User.find(session[:user_id])
    @task = Task.create(text: params[:task][:text], user: @user)
    redirect_to '/tasks'
  end

  def index
    @tasks = Task.where(user_id: session[:user_id])
  end
end
