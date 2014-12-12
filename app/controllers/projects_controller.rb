class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]


  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
  end

  def create
    @project = Project.new(project_params)
      if @project.save
        redirect_to @project, notice: 'Project was successfully created'
      else
        render :new
    end
  end

  def update
    @project.update(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully deleted.' }
    end
  end


private
def set_project
  @project = Project.find(params[:id])
end


  def project_params
    params.require(:project).permit(:name)
  end

end
