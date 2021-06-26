class Api::V1::ApitasksController < ApiController
before_action :set_task,only:[:show]
# ActiveRecordのレコードが見つからなければ404 not foundを応答する
rescue_from ActiveRecord::RecordNotFound do |exception|
render json: { error: '404 not found' }, status: 404
end
def index
    tasks = Task.all
    render json: tasks
end
def show
    render json: @task
end

private
    def set_task
        @task = Task.find(params[:id])
    end
end