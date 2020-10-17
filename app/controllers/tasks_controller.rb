class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  # 一覧表示
  def index
    # @tasks = Task.all
    @tasks = current_user.tasks.order(id: :desc)
  end
  
  # 詳細表示
  def show
  end
  
  # 新規作成
  def new
    # @task = Task.new
    @task = current_user.tasks.build
  end
  
  # 保存
  def create
    @task = current_user.tasks.build(task_params)
    
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
  end
  
  # 更新
  def update
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
    @task.destroy
    flash[:success] = "Task は正常に削除されました"
    redirect_to tasks_url
  end
  
  
  private
  
  # idと一致するレコードを取得
  def set_task
    @task = Task.find_by(params[:id])
  end
  
  # Strong Prameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  # 対象のtaskは本当にログインユーザが所有しているものか
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
