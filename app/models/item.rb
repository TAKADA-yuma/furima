class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :fee
  belongs_to :days
  belongs_to :user
  has_one  :shipment
  has_many :item_tag_relations, dependent: :destroy
  has_many :tags, through: :item_tag_relations, dependent: :destroy
  has_many :comments


  has_many_attached :images


  validates :name, presence: true
  validates :exp, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :status_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :fee_id, numericality: { other_than: 0, message: "を選択して下さい"}
  validates :days_id, numericality: { other_than: 0, message: "を選択して下さい"}
end
