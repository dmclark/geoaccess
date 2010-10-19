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

end
