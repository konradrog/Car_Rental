class AddImageToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :image, :string
  end
end
