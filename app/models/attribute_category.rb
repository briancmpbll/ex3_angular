# Model for attribute categories.
class AttributeCategory < ActiveRecord::Base
  include Nameable

  # attributes is already used in ActiveRecord. Need to choose a custom name for the association.
  has_many :child_attributes, foreign_key: 'attribute_category_id', class_name: 'Attribute',
                              dependent: :destroy
end
