class RecordsController < ApplicationController
  # ログインしていないuserがURL入力で操作しようとした場合、ログイン画面に遷移する
  before_action :authenticate_user!
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.valid?
      @record.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @record.destroy
    redirect_to root_path
  end

  private
  def record_params
    params.require(:record).permit(:kt, :pulse, :systolic, :diastolic, :bw, :palpitation, :suffocation, :swelling, :fatigue, :start_time).merge(user_id: current_user.id)
  end

  def set_record
    @record = Record.find(params[:id])
  end
end
