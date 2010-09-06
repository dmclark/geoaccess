class AddFieldsToVenue < ActiveRecord::Migration
  def self.up
    add_column :venues, :phone, :string
    add_column :venues, :description, :text
    add_column :venues, :info_html, :text
    add_column :venues, :deaf_access, :text
    add_column :venues, :blind_access, :text
    add_column :venues, :mobility_access, :text
    add_column :venues, :restroom_access, :text
    add_column :venues, :neighborhood_id, :integer
  end

  def self.down
    remove_column :venues, :neighborhood_id
    remove_column :venues, :deaf_access
    remove_column :venues, :blind_access
    remove_column :venues, :mobility_access
    remove_column :venues, :restroom_access
    remove_column :venues, :info_html
    remove_column :venues, :description
    remove_column :venues, :phone
  end
end