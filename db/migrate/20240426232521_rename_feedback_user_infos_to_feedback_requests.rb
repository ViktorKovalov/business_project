class RenameFeedbackUserInfosToFeedbackRequests < ActiveRecord::Migration[7.1]
  def change
    rename_table :feedback_user_infos, :feedback_requests
  end
end
