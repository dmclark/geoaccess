class Route < ActiveRecord::Base
  attr_accessor :startpaint_id, :endpaint_id, :directions, :rta_directions
  
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
  
  def rta_directions
     Nokogiri::HTML(goroo_results).css('#tripPlan').text.html_safe
  end
  
  def distance
    Nokogiri::XML(parsed_xml).xpath('/DirectionsResponse/route/leg/distance/text').text.html_safe
  end
  
  
  def parsed_xml
    GoogleDirections.new(startpoint.location, endpoint.location).xml
  end
  
  def goroo_results
    RestClient.post 'http://goroo.com/goroo/showTripPlanResults.htm', 
      {:params => {"calendarOpen" => "false", 
          "calendarClick" => "false", 
          "advanced" => "",
          "newTrip" => "yes", 
          "newRequest" => "true", 
          "trip" => "0",
          "dummy" => "", 
          "origAddress" => startpoint.location,
          "destAddress" => endpoint.location,
          "arriveLeave" => "dep",

          "travelDate" => "11/17/10",
          "hour"  => "3",
          "minute" => "00",
          "ampm" => "pm",

          "train" => "true", 
          "bus"  => "true", 
          "tripPreference"  => "LEASTTIME",

          "walkPreference"  => "0.50",
          "accessibleRequired"  => "true",
          "takeMeThere" => "Get Public transit directions" }
          }
  end
  
  

private 
  def get_xml
    xml = GoogleDirections.new(startpoint.location, endpoint.location).xml
  end
  

end

 