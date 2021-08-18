class UsersController < ApplicationController
  def index
    
  end
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:id])
    @project = @user.projects.find(4)
    @work_target = @project.work_targets.find(2)
  end

  def destroy
  end
end
