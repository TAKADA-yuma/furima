class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :fee
  belongs_to :days
  belongs_to :user
  has_one    :shipment

  has_one_attached :image


  validates :name, presence: true
  validates :exp, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :status_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :fee_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :days_id, numericality: { other_than: 0, message: "を選択して下さい"}
end
