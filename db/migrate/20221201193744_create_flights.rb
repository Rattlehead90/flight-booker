class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.date :start_date
      t.time :start_time
      t.time :duration

      t.timestamps
    end
  end
end
