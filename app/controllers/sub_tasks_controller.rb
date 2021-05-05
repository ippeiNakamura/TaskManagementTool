class SubTasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:work_target_id])
    @flag = Flag.find(params[:flag_id])
    @task = Task.find(params[:task_id])
    @sub_tasks = @task.children
    @assumptionTotalCost = @sub_tasks.sum(:assumptionCost)
    @assumptionday = (@assumptionTotalCost / 7).ceil
    @completionDate = @assumptionday.business_days.from_now.to_time
    @releaseDate = Time.now
    @progress = progress(@completionDate,@releaseDate)
    if params[:task_id]
      #binding.pry
      @title_text = "サブタスク"
    else
      @title_text = "タスク"
    end
  end

  def new
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:work_target_id])
    @flag = Flag.find(params[:flag_id])
    @sub_task = Task.find(params[:task_id]).children.new
    @title_text = "サブタスク"
  end

  def create
    binding.pry
      @task = Task.new(task_params)
      @task.flag_id = params[:flag_id]
    if @task.save!
      redirect_to user_project_work_target_flag_tasks_path,notice:"正常に登録されました。"
    else
      flash.now[:alert] = "登録できませんでした。"  
    end
  end
  def sub_task_create
    @task = Task.find(params[:format]).children.new(task_params)
    
    binding.pry
    
  end
  def edit
  end

  def update
    #binding.pry

  end

  def show
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:work_target_id])
    @flag = Flag.find(params[:flag_id])
    @task = Task.find(params[:id])
    @task_child = Task.find(params[:id]).children
    #binding.pry
    if params[:id]
      @title_text = "サブタスク"
    else
      @title_text = "タスク"
    end
  end

  def destroy
  end
  
  private def task_params
    params.require(:task).permit(
      :name,
      :assumptionCost,
      :memo
    )
  end
  private def progress(completionDate,releaseDate)
    if completionDate <= releaseDate
      @progress = "予定通り"
    else
      #binding.pry
      @progress = (completionDate.to_date - releaseDate.to_date).to_i.to_s + "日遅れ"
    end
  end
end
