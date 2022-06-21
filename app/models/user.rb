class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook,:google_oauth2]

  has_many :items
  has_many :shipments
  has_one :card
  has_one :address

  has_many :sns_credentials
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
   # sns認証したことがあればアソシエーションで取得
   # 無ければemailでユーザー検索して取得orビルド(保存はしない)
   user = User.where(email: auth.info.email).first_or_initialize(
     nickname: auth.info.name,
       email: auth.info.email
   )
   if user.persisted?
    sns.user = user
    sns.save
  end
  { user: user, sns: sns }
  end

  

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :family_name_c, presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/} 
  validates :first_name_c, presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/} 
  validates :family_name_k, presence: true, format: { with:/\A[ァ-ヶー－]+\z/} 
  validates :first_name_k, presence: true, format: { with:/\A[ァ-ヶー－]+\z/} 
end
