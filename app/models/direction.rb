class Direction  
  include ActiveModel::Validations  
  include ActiveModel::Conversion  
  extend ActiveModel::Naming  
    
  attr_accessor :startpoint, :endpoint, :mode  
  
  # validates :startpoint, :presence => "true" 
  # validates :endpoint, :presence => "true" 
  
  def initialize(attributes = {})  
    attributes.each do |name, value|  
      send("#{name}=", value)  
    end  
  end  

    
  def persisted?  
    false  
  end  
end  