class ColumnsController < ApplicationController
  #最新投稿から順に表示する
  def index
    @columns = Column.includes(:user).order("created_at DESC")
  end
end
