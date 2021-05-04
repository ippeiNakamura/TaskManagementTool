class TopsController < ApplicationController
  def show
    @work_target = WorkTarget.find(params[:work_target_id])
  end
end
