class FlagsController < ApplicationController
  def index
    @work_target = WorkTarget.find(params[:work_target_id])
    @flags = @work_target.flags
  end

  def new
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:work_target_id])
    @flag = Flag.new
  end

  def create
    @flag = Flag.new(flag_params)
    @flag.work_target_id = params[:work_target_id]
    if @flag.save
      redirect_to user_project_work_target_flags_path,notice:"登録できました。"
    else
      flash.now = "登録できませんでした。"
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destory
  end
  private def flag_params
    params.required(:flag).permit(:name)
  end
end
