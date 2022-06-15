class Address < ApplicationRecord
  # belongs_to :shipment
  belongs_to :user, optional: true

  belongs_to :prefecture, optional: true

  with_options presence: true do
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフンを入力してください"}
    validates :prefecture_id, numericality: {other_than: 0, message: "を入力してください"}
    validates :city
    validates :house_num
    validates :tel, format: {with: /\A\d{10,11}\z/}
  end
end
