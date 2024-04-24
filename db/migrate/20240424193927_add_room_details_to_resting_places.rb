class AddRoomDetailsToRestingPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :resting_places, :room_number, :string
    add_column :resting_places, :room_description, :string
    add_column :resting_places, :bed_count, :integer
    add_column :resting_places, :price_per_night, :decimal
  end
end
