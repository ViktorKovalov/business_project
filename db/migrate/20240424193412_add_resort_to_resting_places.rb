class AddResortToRestingPlaces < ActiveRecord::Migration[7.1]
  def change
    add_reference :resting_places, :resort, null: false, foreign_key: true
  end
end
