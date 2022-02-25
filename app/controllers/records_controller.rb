class RecordsController < ApplicationController
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
    @record = Record.find(params[:id])
  end

  private
  def record_params
    params.require(:record).permit(:kt, :pulse, :systolic, :diastolic, :bw, :palpitation, :suffocation, :swelling, :fatigue, :start_time).merge(user_id: current_user.id)
  end
end
