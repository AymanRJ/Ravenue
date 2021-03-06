class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :title
      t.string :location
      t.integer :capacity
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
