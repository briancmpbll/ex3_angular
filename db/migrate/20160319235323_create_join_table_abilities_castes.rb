class CreateJoinTableAbilitiesCastes < ActiveRecord::Migration
  def change
    create_join_table :abilities, :castes do |t|
      t.index [:ability_id, :caste_id], unique: true
      t.index :ability_id
      t.index :caste_id
    end
  end
end
