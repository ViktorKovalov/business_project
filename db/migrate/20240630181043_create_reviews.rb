class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :user_id
      t.integer :resting_place_id

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :resting_place_id
  end
end
