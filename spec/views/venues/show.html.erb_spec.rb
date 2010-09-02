require 'spec_helper'

describe "venues/show.html.erb" do
  before(:each) do
    @venue = assign(:venue, stub_model(Venue,
      :name => "Name",
      :address => "Address",
      :city => "City",
      :state => "State",
      :zip => 1,
      :url => "Url",
      :is_active => false,
      :ventype_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Address".to_s)
    rendered.should contain("City".to_s)
    rendered.should contain("State".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Url".to_s)
    rendered.should contain(false.to_s)
    rendered.should contain(1.to_s)
  end
end
