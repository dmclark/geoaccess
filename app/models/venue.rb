class Venue < ActiveRecord::Base
  belongs_to :ventype, :class_name => "Ventype", :foreign_key => "ventype_id"
end
