class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :passport_num

      t.timestamps
    end
  end
end
