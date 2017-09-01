class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :surname
      t.string :e_mail
      t.string :address
      t.datetime :from_date
      t.datetime :to_date

      t.timestamps
    end
  end
end
