class CreateListingsBookings < ActiveRecord::Migration
  def change
    create_table :listings_bookings do |t|
      t.belongs_to :listing, index: true, foreign_key: true
      t.belongs_to :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
