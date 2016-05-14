class AddPlayerAnimaToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :player, :string
    add_column :characters, :anima, :string
  end
end
