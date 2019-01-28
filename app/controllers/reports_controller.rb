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
    report.delete
    flash[:success] = "通報を取り消しました"
    redirect_to root_url
  end

  def index
    @reports = Report.all
  end

  def show
    report = Report.find(params[:id]).live_house_id
    @live_house = LiveHouse.find(report)
    @live_house_ver = @live_house.versions.page(params[:page]).per(15)
  end

  def show_ver
    @live_house = LiveHouse.find(params[:house_id])
    @live_house_ver = @live_house.versions.find(params[:ver_id]).reify
    unless @live_house.image_id == ""
      @photo = Photo.find(@live_house.image_id)
    end
  end

end
