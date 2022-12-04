# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create([{ code: 'LHR', city: 'London' }, { code: 'IST', city: 'Istambul' },
                           { code: 'CDG', city: 'Paris' }, { code: 'AMS', city: 'Amsterdam' },
                           { code: 'FRA', city: 'Frankfurt am Main' }, { code: 'MAD', city: 'Madrid' },
                           { code: 'BCN', city: 'Barcelona' }, { code: 'LGW', city: 'Gatwick' },
                           { code: 'MUC', city: 'Munich' }, { code: 'FCO', city: 'Rome' }])

flights_data = []
10.times do |l|
  10.times do |i|
    10.times do |j|
      flights_data << { departure_airport_id: i + 1, arrival_airport_id: j + 1,
                        start_date: "2022/12/#{l + 10}", start_time: '10:00:00', duration: '02:10' }
      flights_data << { departure_airport_id: j + 1, arrival_airport_id: i + 1,
                        start_date: "2022/12/#{l + 10}", start_time: '20:00:00', duration: '03:10' }
    end
  end
end

flights = Flight.create(flights_data)
