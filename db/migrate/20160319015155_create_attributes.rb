class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :name, null: false
      t.references :attribute_category, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :attributes, :name, unique: true
  end
end
