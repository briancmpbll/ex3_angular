class CreateCharacterAbilities < ActiveRecord::Migration
  def change
    create_table :character_abilities do |t|
      t.references :character, index: true, foreign_key: true, null: false
      t.references :ability, index: true, foreign_key: true, null: false
      t.integer :value

      t.timestamps null: false

      t.index [:character_id, :ability_id], unique: true
    end
  end
end
