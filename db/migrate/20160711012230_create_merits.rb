class CreateMerits < ActiveRecord::Migration
  def change
    create_table :merits do |t|
      t.string :name, null: false
      t.integer :valid_values, array: true, null: false

      t.timestamps null: false

      t.index :name, unique: true
    end
  end
end
