namespace :db do
require "csv"
  desc "Import a csv fil from the data/csv directory"
  task :importcsv => :environment do
      CSV.foreach("db/csv/attractions.csv") do |attraction| 
          venue = Venue.find_or_initialize_by_name("#{attraction[2]}") 
          venue.is_active = attraction[1]
          # venue.neighborhood = Neighborhood.find_or_createe_by_name("#{attraction[2]}") 
          # venue.description   = attraction[5]
          venue.address   = attraction[3]
          venue.city      = attraction[4].nil? ? 'Chicago' : attraction[4]
          venue.state     = attraction[5].nil? ? 'IL' : attraction[5]
          venue.zip       = attraction[6]
          venue.phone       = attraction[7]
          venue.url       = attraction[8]
          venue.info_html       = attraction[9]
          venue.deaf_access       = attraction[10]
          venue.blind_access       = attraction[11]
          venue.mobility_access       = attraction[12]
          venue.restroom_access       = attraction[13]
          venue.ventype = Ventype.find_or_create_by_name('Attraction') 
          venue.save
        
      end
      puts "#{CSV.open("db/csv/attractions.csv").count} attractions imported"

      CSV.foreach("db/csv/hotels.csv") do |hotel| 
          venue = Venue.find_or_initialize_by_name("#{hotel[4]}") 
          venue.is_active = hotel[1]
          venue.neighborhood = Neighborhood.find_or_create_by_name("#{hotel[2]}") 
          venue.description   = hotel[5]
          venue.address   = hotel[6]
          venue.city      = hotel[7].empty? ? 'Chicago' : hotel[7]
          venue.state     = hotel[8].empty? ? 'IL' : hotel[8]
          venue.zip       = hotel[9]
          venue.phone       = hotel[10]
          venue.url       = hotel[13]
          venue.info_html       = hotel[14]
          venue.deaf_access       = hotel[15]
          venue.blind_access       = hotel[16]
          venue.mobility_access       = hotel[17]
          venue.ventype = Ventype.find_or_create_by_name('Hotel') 
          venue.save
      end
      puts "#{CSV.open("db/csv/hotels.csv").count} hotels imported"
   
      CSV.foreach("db/csv/museums.csv") do |museum| 
          venue = Venue.find_or_initialize_by_name("#{museum[2]}") 
          venue.is_active = museum[1]
          # venue.neighborhood = Neighborhood.find_or_createe_by_name("#{museum[2]}") 
          # venue.description   = museum[5]
          venue.address   = museum[3]
          venue.city      = museum[4].empty? ? 'Chicago' : museum[4]
          venue.state     = museum[5].empty? ? 'IL' : museum[5]
          venue.zip       = museum[6]
          venue.phone       = museum[7]
          venue.url       = museum[9]
          venue.info_html       = museum[10]
          venue.deaf_access       = museum[11]
          venue.blind_access       = museum[12]
          venue.mobility_access       = museum[13]
          venue.restroom_access       = museum[14]
          venue.ventype = Ventype.find_or_create_by_name('Museum') 
          venue.save
      end
      puts "#{CSV.open("db/csv/museums.csv").count} museums imported"

      CSV.foreach("db/csv/nightclubs.csv") do |nightclub| 
          venue = Venue.find_or_initialize_by_name("#{nightclub[2]}") 
          venue.is_active = nightclub[1]
          # venue.neighborhood = Neighborhood.find_or_createe_by_name("#{nightclub[2]}") 
          # venue.description   = nightclub[5]
          venue.address   = nightclub[3]
          venue.city      = nightclub[4].nil? ? 'Chicago' : nightclub[4]
          venue.state     = nightclub[5].nil? ? 'IL' : nightclub[5]
          venue.zip       = nightclub[6]
          venue.phone       = nightclub[7]
          venue.url       = nightclub[8]
          venue.info_html       = nightclub[9]
          venue.deaf_access       = nightclub[10]
          venue.blind_access       = nightclub[11]
          venue.mobility_access       = nightclub[12]
          venue.restroom_access       = nightclub[13]
          venue.ventype = Ventype.find_or_create_by_name('Nightclub') 
          venue.save
      end
      puts "#{CSV.open("db/csv/nightclubs.csv").count} nightclubs imported"

    
    
  end
  

end