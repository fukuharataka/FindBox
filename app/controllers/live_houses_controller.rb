class LiveHousesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit_basic, :edit_detail]
  before_action :set_paper_trail_whodunnit, only:[:create, :update_basic, :update_detail, :destroy]
  def new
    @live_house = LiveHouse.new
  end

  def create
    @live_house = LiveHouse.new(basic_params)
    if @live_house.save
      flash[:success] = "ライブハウスを新規に登録しました"
      redirect_to live_house_path(@live_house)
    else
      render 'new'
    end
  end

  def index
    if params[:q].nil?
      @live_houses = LiveHouse.page(params[:page]).per(15)
    else
      @q = params[:q]
      @live_houses = LiveHouse.ransack(name_or_prefecture_cont: @q).result.page(params[:page]).per(15)
    end
  end

  def show
    @live_house = LiveHouse.find(params[:id])
    unless @live_house.image_id == ""
      @photo = Photo.find(@live_house.image_id)
    end
  end

  def edit_basic
    @live_house = LiveHouse.find(params[:id])
    unless @live_house.image_id == ""
      @photo = Photo.find(@live_house.image_id)
    end
  end

  def edit_detail
    @live_house = LiveHouse.find(params[:id])
  end

  def update_basic
    @live_house = LiveHouse.find(params[:id])
    if @live_house.update(basic_params)
      flash[:success] = "ライブハウスの基本情報を更新しました"
      redirect_to live_house_path(@live_house)
    else
      render 'edit_basic'
    end
  end

  def update_detail
    @live_house = LiveHouse.find(params[:id])
    if @live_house.update(detail_params)
      flash[:success] = "ライブハウスの詳細情報を更新しました"
      redirect_to live_house_path(@live_house)
    else
      render 'edit_basic'
    end
  end

  def destroy
    live_house = LiveHouse.find(params[:id])
    live_house.enable = false
    if LiveHouse.save
      flash[:success] = "ライブハウスを削除しました"
      redirect_to reports_index_path
    else
      flash[:success] = "ライブハウスを削除できませんでした"
      redirect_to reports_index_path
    end
  end

  def js_test
  end

private
  def detail_params
    params.require(:live_house).permit(:detail)
  end

  def basic_params
    params.require(:live_house).permit(:name, :hp_url, :capacity, :prefecture, :address, :phone_number, :image_id)
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end

end
