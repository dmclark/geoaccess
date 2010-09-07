class NeighborhoodController < ApplicationController
  def show
    @title = 'All venues in ' + params[:neighborhood_name]
    @venues = Neighborhood.find_by_name(params[:neighborhood_name]).venues
    # redirect(:controller => "venues",  :action => "index" )
  end

end
