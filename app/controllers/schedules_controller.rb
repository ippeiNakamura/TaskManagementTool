class SchedulesController < ApplicationController
  def index
    @title = 'スケジューリング'
    @task = Task.find(100)
    @tasks = Task
    gon.task_name = @task.name
    gon.time = @task.assumptionCost

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
end
