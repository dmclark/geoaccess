# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Ventype.delete_all
Ventype.create( :name => "Attraction" )
Ventype.create( :name => "Hotel" )
Ventype.create( :name => "Museum" )
Ventype.create( :name => "Nightclub" )
Ventype.create( :name => "Resturaunt" )
Ventype.create( :name => "Sport Venue" )
Ventype.create( :name => "Theatre" )
