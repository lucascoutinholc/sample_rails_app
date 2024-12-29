class ChangeResetSendAtColumnToResetSentAtColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column(:users, :reset_send_at, :reset_sent_at)
  end
end
