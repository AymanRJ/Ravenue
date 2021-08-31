class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :venues, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # Reservations creates the join table to see the bookings a Host recieves
  has_many :reservations, through: :venues, source: :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :avatar

  def avatar_url
    if avatar.attached?
      avatar.service_url
    else
      "https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png"
    end
  end
end
