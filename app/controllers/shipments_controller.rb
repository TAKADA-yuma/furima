class ShipmentsController < ApplicationController
  before_action :set_item, only:[:index,:create,:move_to_index]
  before_action :authenticate_user!, only:[:index]
  before_action :move_to_index
  before_action :purchased

  def index
    @shipment_address = ShipmentAddress.new 
  end

  def create
    @shipment_address = ShipmentAddress.new(shipment_params)
    if @shipment_address.valid?
      pay_item
      @shipment_address.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def shipment_params
    params.require(:shipment_address).permit(:post_num, :prefecture_id, :city, :house_num, :building,:tel).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: shipment_params[:token],    
      currency: 'jpy'                 
        )
  end
  
  def move_to_index
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def purchased
    if  @item.shipment.present? 
      redirect_to root_path
    end
  end

end
