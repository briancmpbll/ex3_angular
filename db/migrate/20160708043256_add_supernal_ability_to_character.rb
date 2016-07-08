class AddSupernalAbilityToCharacter < ActiveRecord::Migration
  def change
    add_reference :characters, :supernal_ability, references: :abilities
    add_foreign_key :characters, :abilities, column: :supernal_ability
  end
end
