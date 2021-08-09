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
    @work_target =@user.tasks
  end

  def destroy
  end
end
