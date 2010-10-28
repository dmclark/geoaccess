class RoutesController < ApplicationController
    
  def new
    @route = Route.new
    @venues = Venue.all
  end

  def create
    @route = Route.new(params[:route])
    respond_to do |format|
      format.js {render :action => 'new', :layout => false }
      format.html {render :action => 'show'}
    end  
    
  end
  

end