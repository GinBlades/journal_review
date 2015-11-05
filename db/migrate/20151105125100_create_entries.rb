class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.string :body, null: false
      t.string :token, null: false

      t.timestamps null: false
      t.index :token, unique: true
    end
  end
end
