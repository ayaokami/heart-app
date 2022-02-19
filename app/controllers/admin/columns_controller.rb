class Admin::ColumnsController < ApplicationController
  # ログインしていないuserがURL入力で操作しようとした場合、ログイン画面に遷移する
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  # ログインしていても、管理者以外はトップページに遷移する
  before_action :if_not_admin

  # 以下に管理者が行うアクションを記載
  def new
    @column = Column.new
  end

  def create
    @column = Column.new(column_params)
    if @column.valid?
      @column.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @column = Column.find(params[:id])
  end

  def update
    @column = Column.find(params[:id])
    if @column.update(column_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    column = Column.find(params[:id])
    column.destroy
    redirect_to root_path
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def column_params
    params.require(:column).permit(:title, :text, :genre_id).merge(user_id: current_user.id)
  end
end
