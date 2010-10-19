require 'spec_helper'

describe DirectionsController do

  describe "GET 'indax'" do
    it "should be successful" do
      get 'indax'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

end
