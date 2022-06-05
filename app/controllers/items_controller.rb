class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:edit,:destroy]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  # before_action :another_user, only: [:edit,:destroy]
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
    # params[:q]がnilではない且つ、params[:q][:name]がnilではないとき（商品名の欄が入力されているとき）
    # if params[:q] && params[:q][:name]と同じような意味合い
    if params[:q]&.dig(:name)
      # squishメソッドで余分なスペースを削除する
      squished_keywords = params[:q][:name].squish
      ## 半角スペースを区切り文字として配列を生成し、paramsに入れる
      params[:q][:name_cont_any] = squished_keywords.split(" ")
    end
    @q = Item.ransack(params[:q])
    @items = @q.result
    @category = []
    Category.all.each do |c|
      if c.id > 0
        @category.push(c)
      end
    end
  end

  def tag_search
    if params[:keyword] == ""
      return nil
    else
      tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
      render json:{ keyword: tag }
    end
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
