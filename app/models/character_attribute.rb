# Model for the value of a character's attribute rating.
class CharacterAttribute < ActiveRecord::Base
  belongs_to :character
  belongs_to :attribute_data, class_name: 'Attribute',
                              foreign_key: 'attribute_id'

  validates_presence_of :character
  validates_presence_of :attribute_data

  validates_uniqueness_of :attribute_data, scope: :character_id
  validates_uniqueness_of :character, scope: :attribute_id

  validates_inclusion_of :value, in: 0..5
end
