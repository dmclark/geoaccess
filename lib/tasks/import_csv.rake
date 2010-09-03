namespace :db do
require "csv"
require "Venue"
  desc "Import a csv fil from the data/csv directory"
  task :importcsv do
      CSV.foreach("db/csv/hotels.csv") do |row| 
        
          venue = Venue.find_or_initialize_by_name("#{row[4]}") 
          venue.address   = row[6]
          venue.city      = row[7]
          venue.state     = row[8]
          venue.zip       = row[9]
          venue.url       = row[13]
          venue.is_active = row[1]
          venue.ventype_id = 9
          venue.save
      end
    
  end
  

end