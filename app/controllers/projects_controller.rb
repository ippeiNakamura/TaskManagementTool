class ProjectsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @projects = @user.projects
    
  end

  def new
    @user = User.find(params[:user_id])
    @project = Project.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = Project.new(project_params)
    @project.user_id = @user.id 
    if @project.save
      redirect_to user_projects_path(@user),notice: "プロジェクトを登録しました。"
    else
      flash.now[:alert] = "プロジェクトを登録できませんでした"
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private def project_params
    params.require(:project).permit(:name)
  end
end
