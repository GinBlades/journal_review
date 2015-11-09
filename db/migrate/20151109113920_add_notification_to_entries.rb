class AddNotificationToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :reviewer_notified, :datetime
  end
end
