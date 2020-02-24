class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params.merge(user_id: session[:user_id]))
    redirect_to user_tasks_path(session[:user_id])
  end

  def index
    @tasks = Task.where(user_id: session[:user_id])
  end

  private

  def task_params
    params.require(:task).permit(:text)
  end
end
