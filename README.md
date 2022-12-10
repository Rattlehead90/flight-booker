# Gist 

This app simulates the basic functions of a flight-booking app.

A typical airline booking flow:

- Enter desired dates / airports and click “Search” 📅
- Choose from among a list of available flights 🛫
- Enter passenger information for all passengers 🧑
- Enter billing information 💶

See more at (https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker)

# Demo
![](https://github.com/Rattlehead90/flight-booker/blob/main/flight-booker-demo.gif)

# Main Goal

I've created this barebones app to practice **backend for nested forms and complex associations** (see database diagram below). 

# Details

![database diagram](https://github.com/Rattlehead90/flight-booker/blob/main/database_schema.png)

The airports were associated with flights as arrival and departure airports.

```Ruby
# app/models/airport.rb
has_many :departure_flights, class_name: 'Flight',
                            foreign_key: 'departure_airport_id', 
                              dependent: :destroy

has_many :arrival_flights, class_name: 'Flight',
                          foreign_key: 'arrival_airport_id',
                            dependent: :destroy
```

```Ruby
#app/models/flight.rb
belongs_to :departure_airport, class_name: 'Airport',
                              foreign_key: 'departure_airport_id'
belongs_to :arrival_airport, class_name: 'Airport',
                            foreign_key: 'arrival_airport_id'
```

The main core of the database though are the connections between <code>Bookings</code>, <code>Flights</code> and <code>Passengers</code> models. The idea was to allow each flight to onboard many passengers and each passenger to board many flights through booking model (so *many-to-many through*). 

```Ruby
#app/models/flight.rb
has_many :bookings, foreign_key: :flight_id
has_many :passengers, through: :bookings, source: :passenger
```

```Ruby
#app/models/booking.rb
has_many :passengers
belongs_to :flight
```

```Ruby 
#app/models/passenger.rb
belongs_to :booking
has_many :flights, through: :bookings
```

That was the backend at the proverbial fingertips of the controllers to throw the the whole *book-the-flight-to-London-next-month* proces.
