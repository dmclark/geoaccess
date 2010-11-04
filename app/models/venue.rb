# == Schema Information
# Schema version: 20100907141647
#
# Table name: venues
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  address         :string(255)
#  city            :string(255)
#  state           :string(255)
#  zip             :integer
#  url             :string(255)
#  is_active       :boolean
#  ventype_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#  phone           :string(255)
#  description     :text
#  info_html       :text
#  deaf_access     :text
#  blind_access    :text
#  mobility_access :text
#  restroom_access :text
#  neighborhood_id :integer
#  latitude        :float
#  longitude       :float
#

class Venue < ActiveRecord::Base
  attr_accessible :name
  belongs_to :ventype, :class_name => "Ventype", :foreign_key => "ventype_id"
  belongs_to :neighborhood, :class_name => "Neighborhood", :foreign_key => "neighborhood_id"
  geocoded_by :location
 	after_validation :fetch_coordinates
  acts_as_mappable :default_units => :miles, 
                   :default_formula => :sphere, 
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  default_scope :order => 'name  ASC'
  
  def cleanaddress
    self.address.gsub(/\s[(].*[)]/ , '')
  end

  def location
    [self.cleanaddress, self.city, self.state].compact.join(', ')
  end
  
  def latlong
    [latitude, longitude].join(', ')
  end
  
  
  def group_by_clause
    fields = Array.new
    Venue.columns_hash.each do |column|
      fields[]= column
    end
    fields.join(",")
  end
end
