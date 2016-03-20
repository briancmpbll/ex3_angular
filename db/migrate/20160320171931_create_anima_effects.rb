class CreateAnimaEffects < ActiveRecord::Migration
  def change
    create_table :anima_effects do |t|
      t.string :condition, null: false
      t.string :effect, null: false
      t.references :owner, polymorphic: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
