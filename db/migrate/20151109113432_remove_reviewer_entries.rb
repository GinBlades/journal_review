class RemoveReviewerEntries < ActiveRecord::Migration
  def up
    drop_table :reviewer_entries
  end
  def down
    create_table :reviewer_entries do |t|
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.belongs_to :entry, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
