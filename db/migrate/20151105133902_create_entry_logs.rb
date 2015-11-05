class CreateEntryLogs < ActiveRecord::Migration
  def change
    create_table :entry_logs do |t|
      t.belongs_to :entry, index: true, foreign_key: true
      t.integer :revision
      t.string :body

      t.timestamps null: false
    end
  end
end
