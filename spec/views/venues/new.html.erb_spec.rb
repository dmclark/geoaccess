require 'spec_helper'

describe "venues/new.html.erb" do
  before(:each) do
    assign(:venue, stub_model(Venue,
      :new_record? => true,
      :name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1,
      :url => "MyString",
      :is_active => false,
      :ventype_id => 1
    ))
  end

  it "renders new venue form" do
    render

    rendered.should have_selector("form", :action => venues_path, :method => "post") do |form|
      form.should have_selector("input#venue_name", :name => "venue[name]")
      form.should have_selector("input#venue_address", :name => "venue[address]")
      form.should have_selector("input#venue_city", :name => "venue[city]")
      form.should have_selector("input#venue_state", :name => "venue[state]")
      form.should have_selector("input#venue_zip", :name => "venue[zip]")
      form.should have_selector("input#venue_url", :name => "venue[url]")
      form.should have_selector("input#venue_is_active", :name => "venue[is_active]")
      form.should have_selector("input#venue_ventype_id", :name => "venue[ventype_id]")
    end
  end
end
