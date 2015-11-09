class CreateEntryReviewers < ActiveRecord::Migration
  def change
    create_table :entry_reviewers do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
