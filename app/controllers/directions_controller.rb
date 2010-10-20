class DirectionsController < ApplicationController
  def new
    @direction = Direction.new
    @venues = Venue.all
  end

  def create
    @direction = Direction.new(params[:direction])  
    if @direction.valid?  
      # TODO send direction here  
      flash[:notice] = "go"  
      render :action => 'show'    
    else  
      render :action => 'new'  
    end  
  end
  
  def show
    start = Venue.find(params[:startpoint]).location
    destination = Venue.find(params[:endpoint]).location
    @directions = GoogleDirections.new(start,destination).xml
  end
  

end
