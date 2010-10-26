class Route < ActiveRecord::Base
  attr_accessor :startpaint_id, :endpaint_id, :directions
  
  belongs_to :startpoint, :class_name => "Venue", :foreign_key => "startpoint_id"
  belongs_to :endpoint, :class_name => "Venue", :foreign_key => "endpoint_id"
  
  validates :startpoint_id, :presence => true 
  validates :endpoint_id, :presence => true 
  
  after_create :get_xml
  
  def directions
     Nokogiri::XML(parsed_xml).xpath('//step').map do |i| 
      {'description' => i.xpath('html_instructions').text.html_safe, 
        'distance' => i.xpath('distance/text').text.html_safe
        }
        end 
  end
  
  def parsed_xml
    GoogleDirections.new(startpoint.location, endpoint.location).xml
  end
  

private 
  def get_xml
    xml = GoogleDirections.new(startpoint.location, endpoint.location).xml
  end
  

end

 