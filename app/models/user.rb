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
end
