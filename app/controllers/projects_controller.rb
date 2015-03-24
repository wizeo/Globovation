class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy] 
  before_filter :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @projects = Project.all.order('created_at DESC').paginate(:page => params[:page], :per_page =>3)
    respond_with @projects
  end

  def show
    respond_with @project
  end

  def new
    @project = current_user.projects.build
    respond_with @project
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)
    @project.is_published = true if published?
    flash[:notice] = "Project was successfully created." if @project.save
    respond_with @project
  end

  def update
    @project.update(project_params)
    @project.is_published = true if published?
    @project.is_published = nil if unpublished?
    flash[:notice] = "Project was successfully updated." if @project.save
    respond_with @project
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project was successfully deleted."
    respond_with @project
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def correct_user
      @project = current_user.projects.find_by(id: params[:id])
      redirect_to projects_path, alert: "Not authorized to edit this project" if @project.nil?
    end  

    def project_params
      params.require(:project).permit(:title, :description, :main_img_url, :image, :blurb, :budget, :is_published, :location)
    end

    def published?
      params[:commit] == "Publish"
    end

    def unpublished?
      params[:commit] == "Unpublish"
    end
end
