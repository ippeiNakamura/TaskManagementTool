class TopsController < ApplicationController
  def show
    @work_target = WorkTarget.find(params[:work_target_id])
    @flag = Flag.find(params[:flag_id])
  end
end
