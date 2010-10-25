class DirectionsController < ApplicationController
  def new
    @direction = Direction.new
    @venues = Venue.all
  end

  def create
    @direction = Direction.new(params[:direction])  
    respond_to do |format|
      format.html do
        if @direction.valid?  
          flash[:notice] = "go"  
          redirect_to get_directions_path( params[:direction][:startpoint], params[:direction][:endpoint]  )    
        else
          render :action => 'new'
        end
      format.js do
        # assuming @direction to_json returns a json object with a list of travel directions
        render { render :action => 'create', :layout => false }
      end
    end
    end
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