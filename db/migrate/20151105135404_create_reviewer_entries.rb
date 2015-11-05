class CreateReviewerEntries < ActiveRecord::Migration
  def change
    create_table :reviewer_entries do |t|
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.belongs_to :entry, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
