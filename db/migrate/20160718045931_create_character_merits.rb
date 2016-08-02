class CreateCharacterMerits < ActiveRecord::Migration
  def change
    create_table :character_merits do |t|
      t.references :character, index: true, foreign_key: true, null: false
      t.references :merit, index: true, foreign_key: true, null: false
      t.integer :value, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
