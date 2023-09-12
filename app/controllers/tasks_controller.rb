class TasksController < ApplicationController
  before_action :set_task, only: %i[toggle edit update destroy]
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

  def toggle
    @task.update(completed: params[:completed])
    render json: { message: 'Success' }
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit, status: :unproccessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Tasks successfully deleted'
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
