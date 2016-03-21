class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :concept
      t.references :caste, index: true, foreign_key: true, null: false
      t.integer :willpower
      t.integer :essence

      t.timestamps null: false
    end
  end
end
