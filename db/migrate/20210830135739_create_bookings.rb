class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :event_name
      t.integer :status
      t.date :start_date
      t.date :end_date
      t.integer :rate
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
