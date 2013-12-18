class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
    respond_with @tasks
  end
  def create
    @task = Task.new(task_attributes)
    @task.user = current_user
    @task.save
    respond_with @task
  end
  def update
    @task = current_user.tasks.find(params[:id])
    @task.update_attributes(task_attributes)
    respond_with @task
  end
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    render json: nil
  end
  
  def task_attributes
    params.require(:task).permit(:id, :title, :priority, :completed_at, :due_at)
  end
end
