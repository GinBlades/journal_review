class CreateEntryLogs < ActiveRecord::Migration
  def change
    create_table :entry_logs do |t|
      t.belongs_to :entry, null: false, index: true, foreign_key: true
      t.integer :revision, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
