# == Schema Information
# Schema version: 20100902165058
#
# Table name: venues
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  address    :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :integer
#  url        :string(255)
#  is_active  :boolean
#  ventype_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Venue < ActiveRecord::Base
  attr_accessible :name
  belongs_to :ventype, :class_name => "Ventype", :foreign_key => "ventype_id"
end
