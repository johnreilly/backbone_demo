class WebUiController < ApplicationController
  def show
    @projects = Project.all
  end
end