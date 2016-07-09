class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.string :description, null: false
      t.references :character_ability, index: true, foreign_key: true,
                   null: false

      t.timestamps null: false
    end
  end
end
