class CreateCastes < ActiveRecord::Migration
  def change
    create_table :castes do |t|
      t.string :name, null: false
      t.references :character_type, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :castes, :name, unique: true
  end
end
