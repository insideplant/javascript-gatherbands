class LiveHouse < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lives, class_name: 'Live'
  attachment :image

  # 郵便番号
  validates :postal_code, presence: true, format:
                                        {
                                          with: /\A\d{7}\z/,
                                          message: "ハイフンなし7桁で入力してください",
                                        }
  # 電話番号
  validates :telephone_number, presence: true, format:
                                            {
                                              with: /\A\d{10}$|^\d{11}\z/,
                                              message: "ハイフンなし10桁または11桁で入力してください",
                                            }

  geocoded_by :address
  after_validation :geocode
end
