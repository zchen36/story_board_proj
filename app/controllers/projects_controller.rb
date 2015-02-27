class ProjectsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]


  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      # Handle a successful save.
      flash[:success] = "New projects added!"
      redirect_to @project
    else
      render 'new'
    end
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    #debugger
  end


  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

end
