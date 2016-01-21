class AddToBookings < ActiveRecord::Migration
  def up
  	add_column :bookings, :user_id, :integer
  end
end
