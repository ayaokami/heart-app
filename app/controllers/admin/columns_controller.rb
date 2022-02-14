class Admin::ColumnsController < ApplicationController
  # 管理者以外はトップページに遷移する
  before_action :if_not_admin

  # 以下に管理者が行うアクションを記載
  def new
    @column = Column.new
  end

  def creste
    @column = Column.new(column_params)
    if @column.valid?
      @column.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def column_params
    params.require(:column).permit(:title, :text, genre_id).merge(user_id: current_user.id)
  end
end
