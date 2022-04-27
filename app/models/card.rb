class Card < ApplicationRecord
  belongs_to :user
  attr_accessor :card_token
  # card_tokenはcardテーブルにないため
  #customer_tokenを発行するためのもの。PayJPに送る
  validates :card_token, presence: true
  # これがないとカード情報が正しくなくて、PayJP側でcard_tokenが生成されなくてもcreateが通ってしまう。
end