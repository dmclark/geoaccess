class AddModeToRoute < ActiveRecord::Migration
  def self.up
    add_column :routes, :mode, :string
  end

  def self.down
    remove_column :routes, :mode
  end
end