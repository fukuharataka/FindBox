class ReportsController < ApplicationController
  before_action :authenticate_admin!, only:[]
  def create
    report = Report.new
    report.user_id = current_user.id
    report.live_house_id = params[:id]
    if report.save
      flash[:success] = "通報成功"
      redirect_to root_url
    else
      flash[:success] = "通報失敗"
      redirect_to root_url
    end
  end

  def destroy
    report = Report.find_by(user_id: current_user.id)
    report.destroy
    flash[:success] = "通報を取り消しました"
    redirect_to root_url
  end

  def index
    @reports = Report.all
  end

  def show
  end

end
