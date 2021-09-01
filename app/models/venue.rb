class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
  validates :photos, presence: true
  has_many_attached :photos
end
