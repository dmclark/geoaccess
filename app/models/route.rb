class Route < ActiveRecord::Base
  attr_accessor :startpaint_id, :endpaint_id, :directions
  
  belongs_to :startpoint, :class_name => "Venue", :foreign_key => "startpoint_id"
  belongs_to :endpoint, :class_name => "Venue", :foreign_key => "endpoint_id"
  
  validates :startpoint_id, :presence => true 
  validates :endpoint_id, :presence => true 
  
  after_create :get_xml
  
  def as_json
    base = "http://maps.googleapis.com/maps/api/directions/json?origin="
    string = base + startpoint.location + "&destination=" + endpoint.location + "&mode=walk&sensor=false"    
    resp = Net::HTTP.get_response(URI.parse(URI.escape(string)))
    if resp.inspect.include?('HTTPOK 200 OK')  
      resp.body
    end 
  end
  
  
  def directions
     Nokogiri::XML(parsed_xml).xpath('//step').map do |i| 
      {'description' => i.xpath('html_instructions').text.html_safe, 
        'distance' => i.xpath('distance/text').text.html_safe
        }
        end 
  end
  
  def distance
    Nokogiri::XML(parsed_xml).xpath('/DirectionsResponse/route/leg/distance/text').text.html_safe
  end
  
  
  def parsed_xml
    GoogleDirections.new(startpoint.location, endpoint.location).xml
  end
  

private 
  def get_xml
    xml = GoogleDirections.new(startpoint.location, endpoint.location).xml
  end
  

end

 