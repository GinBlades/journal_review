class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.belongs_to :user, index: true, foreign_key: true
      t.string :body, null: false
      t.string :token, null: false

      t.timestamps null: false
      t.index :token, unique: true
    end
  end
end
