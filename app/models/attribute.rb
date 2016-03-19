# Model for attributes.
class Attribute < ActiveRecord::Base
  include Nameable

  belongs_to :attribute_category
end
