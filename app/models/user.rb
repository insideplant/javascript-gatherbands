class User < ApplicationRecord
  attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :band
  accepts_nested_attributes_for :band

  validates :user_name, presence: true
  validates :last_name_kana, format:
    {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
      message: "全角カタカナのみで入力して下さい",
    }, if: :persisted?
  validates :first_name_kana, format:
    {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
      message: "全角カタカナのみで入力して下さい",
    }, if: :persisted?

  def current_user?(user)
    self == user
  end

  def name
    [first_name, last_name].join(' ')
  end

  def kana_name
    [first_name_kana, last_name_kana].join(' ')
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.user_name = 'guest'
      user.password = SecureRandom.urlsafe_base64
      user.band = Band.find_or_create_by(band_name: 'guest')
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end
