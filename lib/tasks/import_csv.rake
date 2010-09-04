namespace :db do
require "csv"
  desc "Import a csv fil from the data/csv directory"
  task :importcsv => :environment do
      CSV.foreach("db/csv/hotels.csv") do |row| 
          venue = Venue.find_or_initialize_by_name("#{row[4]}") 
          venue.address   = row[6]
          venue.city      = row[7]
          venue.state     = row[8]
          venue.zip       = row[9]
          venue.url       = row[13]
          venue.is_active = row[1]
          venue.ventype_id = 2
          venue.save
      end
      
      CSV.foreach("db/csv/museums.csv") do |museum| 
        venue = Venue.find_or_initialize_by_name("#{museum[2]}") 
        venue.address   = museum[3]
        venue.city      = museum[4].empty? ? 'Chicago' : museum[4]
        venue.state     = museum[5].empty? ? 'IL' : museum[5]
        venue.zip       = museum[6]
        venue.url       = museum[9]
        venue.is_active = museum[1]
        venue.ventype_id = 3
        venue.save
      end
      
      CSV.foreach("db/csv/attractions.csv") do |attraction| 
        venue = Venue.find_or_initialize_by_name("#{attraction[2]}") 
        venue.address   = attraction[3]
        venue.city      = attraction[4].nil? ? 'Chicago' : attraction[4]
        venue.state     = attraction[5].nil? ? 'IL' : attraction[5]
        venue.zip       = attraction[6]
        venue.url       = attraction[8]
        venue.is_active = attraction[2]
        venue.ventype_id = 1
        venue.save
      end
    
  end
  

end