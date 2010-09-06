# == Schema Information
# Schema version: 20100906134036
#
# Table name: neighborhoods
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Neighborhood < ActiveRecord::Base
  has_many :venues
  
  validates :name, :uniqueness => { :case_sensitive => false } 
  
end
