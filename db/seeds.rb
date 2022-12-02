# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create([{ code: 'LHR' }, { code: 'IST' }, { code: 'CDG' }, 
                           { code: 'AMS' }, { code: 'FRA' }, { code: 'MAD' },
                           { code: 'BCN' }, { code: 'LGW' }, { code: 'MUC' },
                           { code: 'FCO' }])

flights_data = []
7.times do |i|
  flights_data << { departure_airport_id: i, arrival_airport_id: i + 1,
              start_datetime: "2022/12/0#{i} 1#{i}:00:00", duration: "0#{i}:00" }
  flights_data << { departure_airport_id: i + 1, arrival_airport_id: i,
              start_datetime: "2022/12/0#{i} 1#{i}:00:00", duration: "0#{i}:00" }
end

flights = Flight.create(flights_data)
