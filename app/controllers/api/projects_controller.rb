class Api::ProjectsController < ApplicationController
  respond_to :json

  def index
    @projects = Project.all
    respond_with @projects
  end

  def show
    @project = Project.find(params[:id])
    respond_with @project
  end

  def create
    @project = Project.new pick(params[:project], :name)
    if @project.save
      respond_with @project, :location => [:api, @project], :status => :created
    else
      respond_with @project
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes pick(params[:project], :name)
    respond_with @project
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_with @project
  end
end