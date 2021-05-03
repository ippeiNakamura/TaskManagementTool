class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
    @assumptionTotalCost = @tasks.sum(:assumptionCost)
    @assumptionday = (@assumptionTotalCost / 7).ceil
    @completionDate = @assumptionday.business_days.from_now.to_time
    @releaseDate = Time.now
    #inding.pry
    @progress = progress(@completionDate,@releaseDate)
    
  end

  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end

  def create
    @user = User.find(params[:user_id])
    @task = Task.new(task_params)
    @task.user_id = params[:user_id]
    #Task.create(params[:task])
    if @task.save!
      redirect_to user_tasks_path(@user),notice:"正常に登録されました。"
    else
      flash.now[:alert] = "登録できませんでした。"  
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
