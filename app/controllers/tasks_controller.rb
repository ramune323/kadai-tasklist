class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:index]
  
  # 一覧表示
  def index
    @tasks = Task.all
  end
  
  # 詳細表示
  def show
    @task = Task.find(params[:id])
  end
  
  # 新規作成
  def new
    @task = Task.new
  end
  
  # 保存
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "Task が正常に作成されました"
      redirect_to @task
    else
      flash.now[:danger] = "Task が作成されませんでした"
      render :new
    end
  end
  
  # 編集
  def edit
    @task = Task.find(params[:id])
  end
  
  # 更新
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = "Task は更新されませんでした"
      render :edit
    end
  end
  
  # 削除
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "Task は正常に削除されました"
    redirect_to tasks_url
  end
  
  private
  
  # Strong Prameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
