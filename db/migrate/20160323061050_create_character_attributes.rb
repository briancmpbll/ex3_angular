class CreateCharacterAttributes < ActiveRecord::Migration
  def change
    create_table :character_attributes do |t|
      t.references :character, index: true, foreign_key: true, null: false
      t.references :attribute, index: true, foreign_key: true, null: false
      t.integer :value

      t.timestamps null: false

      t.index [:character_id, :attribute_id], unique: true
    end
  end
end
