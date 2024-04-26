class CreateFeedbackUserInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :feedback_user_infos do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.text :message

      t.timestamps
    end
  end
end
