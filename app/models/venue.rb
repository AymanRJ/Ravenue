class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
end
