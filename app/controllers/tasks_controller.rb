class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params.merge(user_id: session[:user_id]))
    redirect_to user_tasks_path(user_id: session[:user_id])
  end

  def index
    @tasks = Task.where(user_id: session[:user_id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to user_tasks_path(session[:user_id])
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find(params[:id])
    state = params[:task][:state] == "1" ? true : false
    @task.update!(state: state)
    redirect_to user_tasks_path(user_id: session[:user_id])
  end


  private

  def task_params
    params.require(:task).permit(:text)
  end
end
