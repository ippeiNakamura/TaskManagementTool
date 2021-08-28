class SubTasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:work_target_id])
    @flag = Flag.find(params[:flag_id])
    @task = Task.find(params[:task_id])
    @sub_tasks = @task.sub_tasks
    @assumptionTotalCost = @sub_tasks.sum(:assumptionCost)
    @assumptionday = 0
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
    @task = Task.find(params[:task_id])
    @sub_task = SubTask.new
    @title_text = "サブタスク"
  end

  def create
      @sub_task = SubTask.new(task_params)
      @sub_task.task_id = params[:task_id]
      binding.pry
    if @sub_task.save
      redirect_to user_project_work_target_flag_task_sub_tasks_path,notice:"正常に登録されました。"
    else
      flash.now[:alert] = "登録できませんでした。"  
    end
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
    params.require(:sub_task).permit(
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
