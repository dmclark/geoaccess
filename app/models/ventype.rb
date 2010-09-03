# == Schema Information
# Schema version: 20100902165058
#
# Table name: ventypes
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Ventype < ActiveRecord::Base
  has_many :venues
end

