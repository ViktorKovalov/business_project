class CreateRestingPlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :resting_places do |t|

      t.timestamps
    end
  end
end
