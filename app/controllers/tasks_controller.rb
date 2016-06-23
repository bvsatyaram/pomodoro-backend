class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    task = Task.new
    task.title = params[:title]
    if task.save
      head :created, location: task_url(task)
    else
      head :bad_request
    end
  end

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      head :ok
    else
      head :bad_request
    end
  end
end
