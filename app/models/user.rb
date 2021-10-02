class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password, presence: true, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :family_name_c, presence: true
  validates :first_name_c, presence: true
  validates :family_name_k, presence: true
  validates :first_name_k, presence: true
end
