  class TasksController < ApplicationController
    #before_action :initial_model
    def index
      user = User.find(params[:user_id])
      #user_tasks = user.projects.includes(work_targets: [flags: :tasks])
      render json: Task.al
    end

    def new
      task_category_colection
      @task = Task.new
      @before_request = request.referer
    end

    def create
      task_category
      if @task_category == "タスク"
        @task = Task.new(task_params) #タスクのインスタンス
      else
        @task = @parent_task.children.new(task_params) #サブタスクのインスタンス
      end
      if @task.save
        flash[:notice] =  @task.name  + 'を追加しました'
      else
        flash[:alert] =  @task.name  + 'を追加できませんでした'
      end
      redirect_to params[:task][:before_request]
    end

    def update
      task_category
      @task = Task.find(params[:id])
      @task.assign_attributes(task_params)
      if @task.save
        flash[:notice] =  @task.name  + 'を編集しました'
      else
        flash[:alert] =  @task.name  + 'を編集できませんでした'
      end
      redirect_to request.referer
    end

    def show
    end

    def destroy
      @task = Task.find(params[:id])      
      if @task.destroy
        flash[:notice] =  @task.name  + 'を削除しました'
      else
        flash[:alert] =  @task.name  + 'を削除できませんでした'
      end
      redirect_to request.referer
    end
    
    #####################プライベート######################################################
    private 
      def task_params
        params.require(:task).permit(:name,:assumptionCost,:memo).merge(flag_id:params[:flag_id])
      end
      def initial_model
        @flag = Flag.find(params[:flag_id])
      end

      #想定合計工数の算出
      def assumption_total_Cost(tasks)
          @assumptionTotalCost = tasks.sum(:assumptionCost)
      end

      #完了予定日の算出
      def assumptionday(assumptionTotalCost)
        @assumptionday = (assumptionTotalCost / 7).ceil
      end

      #進捗の算出
      def progress(completionDate,releaseDate)
        if completionDate <= releaseDate
          @progress = "予定通り"
        else
          @progress = (completionDate.to_date - releaseDate.to_date).to_i.to_s + "日遅れ"
        end
      end
      
      def task_category_colection
        if params[:format]
          @task_category = "サブタスク"
          @task = Task.find(params[:format])
          @tasks = @task.children #サブタスクの未取得
          @title = @task.name
          @parent_id = @task.id
        else
          @task_category = "タスク"
          @tasks = @flag.tasks.where(parent_id: nil) #親タスクのみ取得(子を持たない)

          @title = Flag.find(params[:flag_id]).name
        end
      end

      def task_category
        if params[:task][:parent_id] == ""
          @task_category = "タスク"
          @tasks = @flag.tasks
          @title = Flag.find(params[:flag_id]).name
        else
          @task_category = "サブタスク"
          @parent_task = Task.find(params[:task][:parent_id])
          @tasks = @parent_task.children
          @title = @parent_task.name
        end
      end

      def redirect(task)
        if !(task.parent_id == "") 
          @task = task.parent 
        else
          @task = ''
        end
        #タスク一覧へリダイレクト
        if task.save! 
          redirect_to user_project_work_target_flag_tasks_path(@user,@project,@work_target,@flag,@task), notice:"正常に登録されました。"
        else
          redirect_to user_project_work_target_flag_tasks_path(@user,@project,@work_target,@flag,@task), notice:"登録できませんでした。"
        end        
      end
  end
