class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:edit,:destroy]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  before_action :another_user, only: [:edit,:destroy]
  before_action :purchased, only: [:edit]

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end


private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image, :price, :exp, :category_id, :status_id, :fee_id, :prefecture_id, :days_id).merge(user_id: current_user.id)
  end
  
  def another_user
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def purchased
    if  @item.shipment.present? 
      redirect_to root_path
    end
  end

end
