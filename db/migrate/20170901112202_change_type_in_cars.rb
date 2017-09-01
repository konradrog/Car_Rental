class ChangeTypeInCars < ActiveRecord::Migration[5.1]
  def change
    change_table :cars do |t|
      t.change :price, :integer, using: 'price::integer'
    end
  end
end
