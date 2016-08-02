class AddRepeatableToMerit < ActiveRecord::Migration
  def change
    add_column :merits, :repeatable, :boolean, null: false
  end
end
