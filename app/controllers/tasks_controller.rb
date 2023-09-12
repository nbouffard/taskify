class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task successfully created'
    else
      render :new, status: :unproccessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
