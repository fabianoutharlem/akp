namespace :elasticsearch do
  desc "Import all cars currently in the database to the elasticsearch cluster"
  task import_cars: :environment do
    Car.import
    puts 'Cars have been imported'
  end

end
