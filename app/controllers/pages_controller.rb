class PagesController < ApplicationController
  def home
    @title = "Welcome"
  end

  def about
    @title = "About"
  end

end
