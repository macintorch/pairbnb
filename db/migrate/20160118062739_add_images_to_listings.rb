class AddImagesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :images, :text, array: true, default: []
  end
end
