class CreateCharacterTypes < ActiveRecord::Migration
  def change
    create_table :character_types do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :character_types, :name, unique: true
  end
end
