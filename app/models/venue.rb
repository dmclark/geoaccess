# == Schema Information
# Schema version: 20100906134036
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
#

class Venue < ActiveRecord::Base
  attr_accessible :name
  belongs_to :ventype, :class_name => "Ventype", :foreign_key => "ventype_id"
  belongs_to :neighborhood, :class_name => "Neighborhood", :foreign_key => "neighborhood_id"
  # geocoded_by :location
  after_validation :fetch_coordinates
  
  def cleanaddress
    self.address.gsub(/\s[(].*[)]/ , '')
  end
  
  def location
    [self.cleanaddress, self.city, self.state].compact.join(', ')
  end
end
