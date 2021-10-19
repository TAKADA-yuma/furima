class ShipmentAddress
  include ActiveModel::Model
  attr_accessor :post_num, :prefecture_id, :city, :house_num, :building, :tel,:item_id, :user_id, :token

  with_options presence: true do
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :house_num
    validates :tel, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    shipment = Shipment.create(item_id: item_id, user_id: user_id)
    Address.create(post_num: post_num, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building,tel: tel, shipment_id: shipment.id)
  end
end