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
    @user = User.find(params[:user_id])
  end

  def destroy
  end
end
