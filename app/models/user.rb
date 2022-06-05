class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :shipments
  has_one :card

  has_one :address

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :family_name_c, presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/} 
  validates :first_name_c, presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/} 
  validates :family_name_k, presence: true, format: { with:/\A[ァ-ヶー－]+\z/} 
  validates :first_name_k, presence: true, format: { with:/\A[ァ-ヶー－]+\z/} 
end
