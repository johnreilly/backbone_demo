class Api::TasksController < ApplicationController
  respond_to :json

  def index
    @tasks = Task.all
    respond_with @tasks
  end

  def show
    @task = Task.find(params[:id])
    respond_with @task
  end

  def create
    project = Project.find_by_id(params[:task][:project_id])
    @task = Task.new pick(params[:task], :name, :is_done)
    @task.project = project

    if @task.save
      respond_with @task, :location => [:api, @task], :status => :created
    else
      respond_with @task
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes pick(params[:task], :name)
    respond_with @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_with @task
  end
end