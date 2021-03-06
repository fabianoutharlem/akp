namespace :cars do
  desc "generate some dummy cars"
  task generate_dummies: :environment do
    200.times do
      brand = Brand.order('RAND()').first
      model = brand.models.sample

      price = rand(5000..15000)

      car = Car.create(
          brand: brand,
          model: model,
          mileage: rand(10000..200000),
          color: Faker::Commerce.color,
          engine_size: (rand(2..5)*1000).to_s + 'cc',
          manufacture_year: rand(1990..2015),
          energy_label: Faker::Lorem.characters(1),
          road_tax: rand(20..300),
          price_total: price,
          price_50_50: price / 2,
          price_month: price / 60,
          body_type: BodyType.order('RAND()').first,
          fuel_type: FuelType.order('RAND()').first,
          transmission_type: TransmissionType.order('RAND()').first
      )
      4.times do
        car.car_medias.build(remote_file_url: 'http://lorempixel.com/300/300')
        car.save!
      end
      puts "a #{car.brand.name} #{car.model.name} has been created"
    end
  end

end
