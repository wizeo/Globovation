class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy] 
  before_filter :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @solutions = Solution.all
    respond_with @solutions
  end

  def show
    respond_with @solution
  end

  def new
    @solution = current_user.solutions.build
    @project = params[:project_id]
    respond_with @solution   
  end
    

  def edit
  end

  def create
    @solution = current_user.solutions.build(solution_params)
    @project = params[:project_id]
    @solution.save
    respond_with @solution
  end

  def update
    @solution.update(solution_params)
    respond_with @solution
  end

  def destroy
    @solution.destroy
    respond_with @solution
  end

  private
    def set_solution
      @solution = Solution.find(params[:id])
    end

    def solution_params
      params.require(:solution).permit(:title, :description, :votes, :admin_approval, :project_id, :blurb, :is_published)
    end

     def correct_user
      @solution = current_user.solutions.find_by(id: params[:id])
      redirect_to solution_path, alert: "Not authorized to edit this project" if @solution.nil?
    end

end
