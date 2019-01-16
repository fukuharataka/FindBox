class LiveHousesController < ApplicationController
  def new
  end

  def create
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
