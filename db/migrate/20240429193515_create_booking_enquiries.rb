class CreateBookingEnquiries < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_enquiries do |t|
      t.references :resting_place, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.integer :phone_number, null: false
      t.date :check_in_date, null: false # Дата заселения
      t.date :check_out_date, null: false # Дата выселения
      t.text :additional_information # Дополнительные пожелания
      t.timestamps
    end
  end
end
