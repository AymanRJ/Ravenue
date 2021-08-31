class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  enum status: %i[pending accepted rejected] # Same as [:pending, :accepted, :rejected]
  validates :event_name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
