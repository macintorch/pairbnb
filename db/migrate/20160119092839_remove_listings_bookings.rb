class RemoveListingsBookings < ActiveRecord::Migration
  def change
  	drop_table :listings_bookings
  	remove_column :bookings, :booking_id
  end
end
