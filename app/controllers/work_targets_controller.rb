class WorkTargetsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_targets = @project.work_targets
  end

  def new
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.new(work_target_params)
    @work_target.project_id = params[:project_id]
    if @work_target.save
      redirect_to user_project_work_targets_path,notice: "作業対象を追加しました"
    else
      flash.now = "作業対象を追加できませんでした"
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:id])
  end

  def destroy
  end
  private def work_target_params
    params.require(:work_target).permit(:name)
  end
end
