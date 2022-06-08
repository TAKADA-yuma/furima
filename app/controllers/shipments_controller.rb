class ShipmentsController < ApplicationController
  before_action :set_item, only:[:index,:create]
  before_action :authenticate_user!, only:[:index]
  before_action :move_to_index
  before_action :purchased
  before_action :not_resisterd

  def index
    # @shipment_address = ShipmentAddress.new 
    @shipment = Shipment.new
  end

  def create
    # redirect_to new_card_path and return unless current_user.card.present?
    # @shipment_address = ShipmentAddress.new(shipment_params)
    @shipment = Shipment.new(user_id: current_user.id, item_id: params[:item_id])
    if @shipment.valid?
      pay_item
      @shipment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  # def shipment_params
  #   params.require(:shipment_address).permit(:post_num, :prefecture_id, :city, :house_num, :building,:tel).merge(token: current_user.card, user_id: current_user.id, item_id: params[:item_id])
  # end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,    
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

  def not_resisterd
    if current_user.card == nil
      redirect_to new_card_path
    end
  end

end
