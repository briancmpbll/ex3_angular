# Model for the value of a character's attribute rating.
class CharacterAttribute < ActiveRecord::Base
  belongs_to :character
  belongs_to :attribute_data, class_name: 'Attribute',
                              foreign_key: 'attribute_id'
end
