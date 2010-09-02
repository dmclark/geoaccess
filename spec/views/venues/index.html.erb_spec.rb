require 'spec_helper'

describe "venues/index.html.erb" do
  before(:each) do
    assign(:venues, [
      stub_model(Venue,
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => 1,
        :url => "Url",
        :is_active => false,
        :ventype_id => 1
      ),
      stub_model(Venue,
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => 1,
        :url => "Url",
        :is_active => false,
        :ventype_id => 1
      )
    ])
  end

  it "renders a list of venues" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Address".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "City".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "State".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Url".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
