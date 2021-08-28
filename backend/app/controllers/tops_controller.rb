class TopsController < ApplicationController
  def show
    @user = User.find(1)
    @flag = Flag.find(1)
  end
end
