class CreateVenueTypes < ActiveRecord::Migration
  def self.up
    create_table :venue_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :venue_types
  end
end
