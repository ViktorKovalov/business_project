class AddLocationToResort < ActiveRecord::Migration[7.1]
  def change
    add_column :resorts, :location, :string
  end
end
