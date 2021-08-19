class User < ApplicationRecord
  attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :band
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:  :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :follower, through: :passive_relationships, source: :follower

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

  # 自身では無い時follow
  def follow(other_user)
    following << other_user
  end

  # followの解除
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
