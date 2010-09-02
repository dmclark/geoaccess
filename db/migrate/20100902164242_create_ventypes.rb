class CreateVentypes < ActiveRecord::Migration
  def self.up
    create_table :ventypes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ventypes
  end
end
