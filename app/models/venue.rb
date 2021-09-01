class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :title, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
  has_many_attached :photos
end
