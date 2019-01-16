class LiveHousesController < ApplicationController
  before_action :set_live_house, only:[:show, :edit_basic, :edit_detail, :update_basic, :update_detail, :destroy]
  def new
    @live_house = LiveHouse.new
  end

  def create
    @live_house = LiveHouse.new(basic_params)
    if @live_house.save
      flash[:success] = "ライブハウスを新規に登録しました"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
  end

  def show
  end

  def edit_basic
  end

  def edit_detail
  end

  def update_basic
  end

  def update_detail
  end

  def destroy
  end

private
  def set_live_house
    @live_house = Live_house.find(params[:id])
  end

  def detail_params
    params.require(:live_house).permit(:detail)
  end

  def basic_params
    params.require(:live_house).permit(:name, :hp_url, :capacity, :prefecture, :address, :phone_number, :image)
  end
end
