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
      redirect_to get_directions_path( params[:direction][:startpoint],
                 params[:direction][:endpoint]  )    
    else  
      render :action => 'new'  
    end  
  end
  
  def show
    start = Venue.find(params[:start]).location
    destination = Venue.find(params[:destination]).location
    @directions = GoogleDirections.new(start,destination).xml + 'xxxxxxxx'
  end
  

end
