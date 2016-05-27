class AddFavoredToCharacterAbility < ActiveRecord::Migration
  def change
    add_column :character_abilities, :favored, :boolean,
               null: false, default: false
  end
end
