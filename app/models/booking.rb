class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  enum status: %i[pending accepted rejected] # Same as [:pending, :accepted, :rejected]
  validates :event_name, presence: true

  validate :available
  validate :end_date_after_start_date
  validate :start_date_after_today
  
  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def start_date_after_today
    if start_date < Date.today
      errors.add(:start_date, "must be after today")
    end
  end

  def available
    bookings = Booking.where(["venue_id =?", venue_id])
    date_ranges = bookings.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      errors.add(:start_date, "already booked") if range.include? start_date 
      errors.add(:end_date, "already booked") if range.include? end_date 
    end
  end
end
