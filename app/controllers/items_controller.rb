class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:edit,:destroy]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  before_action :another_user, only: [:edit,:destroy]
  before_action :purchased, only: [:edit]

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    # @item = Item.new
    @item_tag = ItemTag.new
  end

  def create
    @item_tag = ItemTag.new(item_params)
    if @item_tag.save
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


  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item_tag).permit(:name, :tag_name, :price, :exp, :category_id, :status_id, :fee_id, :prefecture_id, :days_id, {images: []}).merge(user_id: current_user.id)
    # なぜ？imageの前に追加するよう注意しましょう。
    # なぜ？imagesは最後なのか
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
