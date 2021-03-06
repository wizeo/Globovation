class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy] 
  before_filter :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @projects = Project.all.order('created_at DESC')
    respond_with @projects
  end

  def show
    @solutions = Solution.all
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
    @project.published_at = Time.zone.now if published? 

    @project.save 

    flash[:info] = "Project was created and saved as draft." if draft? && !@project.id.nil?
    flash[:success] = "Project was successfully created and published." if published? && !@project.id.nil?
    
    respond_with @project
     
  end

  def update

    if unpublished?
      @project.is_published = false 
      @project.published_at = nil 
    end

    if published? 
      @project.is_published = true
      @project.published_at = Time.zone.now
    end

    @project.update(project_params) 
    flash[:info] = "Project was updated and saved as draft." if draft?
    flash[:info] = "Project was successfully unpublished." if unpublished?
    flash[:info] = "Project was successfully published." if published?
    flash[:info] = "Project was successfully updated." if updated?

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
      params.require(:project).permit(:title, :description, :main_img_url, :image, :blurb, :budget, :is_published, :location, :published_at)
    end

    def published?
      params[:commit] == "Publish" 
    end

    def unpublished?
      params[:commit] == "Unpublish"
    end

    def draft?
      params[:commit] == "Save as a Draft"
    end

    def updated?
      params[:commit] == "Update"
    end
end
