class AddLatitudeAndLongitudeToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float
  end

  def self.down
    remove_column :venues, :longitude
    remove_column :venues, :latitude
  end
end
