class AddReferencesToReservation < ActiveRecord::Migration[5.1]
  def change
    change_table :reservations do |t|
      t.references :car, foreign_key: true
    end
  end
end
