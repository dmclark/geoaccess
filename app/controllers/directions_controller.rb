class DirectionsController < ApplicationController
    respond_to :html, :js
    
  def new
    @direction = Route.new
    @venues = Venue.all
  end

  def create
    @direction = Route.new(params[:direction])  
  end
  
  def show
    @start = Venue.find(params[:start]).location
    @destination = Venue.find(params[:destination]).location
    xml = GoogleDirections.new(@start,@destination).xml
    doc = Nokogiri::XML(xml)
    @total_distance = doc.xpath('/distance').text.html_safe
    @directions = doc.xpath('//step').map do |i| 
      {'description' => i.xpath('html_instructions').text.html_safe, 
        'distance' => i.xpath('distance/text').text.html_safe
        } 
    end
  
  end
  

end