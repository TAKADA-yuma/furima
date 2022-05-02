class ItemTag
  include ActiveModel::Model

  attr_accessor :name, :price, :exp, :category_id, :status_id, :fee_id, :prefecture_id, :days_id, :images,:id, :created_at, :datetime, :updated_at,:user_id, :tag_name

  validates :name, presence: true
  validates :exp, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :status_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :fee_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :days_id, numericality: { other_than: 0, message: "を選択して下さい"}

  def save
    item = Item.new(name: name,exp: exp,price: price,category_id: category_id,prefecture_id: prefecture_id, status_id: status_id, fee_id: fee_id, images: images, days_id: days_id, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    binding.pry
    if item.valid?
      item.save
      tag.save
      ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
    end
  end

end