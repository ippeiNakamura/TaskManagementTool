class FlagsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:work_target_id])
    @flags = @work_target.flags
    render json: @flags.select(:id,:name)

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
    @flag = Flag.find(params[:id])
    
  end

  def destroy
    @flag = Flag.find(params[:id])      
      if @flag.destroy
        flash[:notice] =  @flag.name  + 'を削除しました'
      else
        flash[:alert] =  @flag.name  + 'を削除できませんでした'
      end
      redirect_to request.referer
  end
  private def flag_params
    params.required(:flag).permit(:name)
  end
  #親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Project.find(params[:parent_name]).work_targets
    binding.pry
  end
end
