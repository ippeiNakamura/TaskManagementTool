class SchedulesController < ApplicationController
  def index
    @title = 'スケジューリング'
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @projects = @user.projects
    @work_target = WorkTarget.find(params[:work_target_id])
    @flags = @work_target.flags
    @tasks = Task.all
    
    #gon.task_name = @task.name
    #gon.time = @task.assumptionCost

    #binding.pry
  end

  def new

  end

  def creat
    binding.pry
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  def ajax
    @select_project = params[:project_id]
    @project = Project.find(params[:project_id])
    @child_worktargets = @project.work_targets
  end
end
