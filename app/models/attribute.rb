# Model for attributes.
class Attribute < ActiveRecord::Base
  include Nameable

  belongs_to :attribute_category

  validates_presence_of :attribute_category
end
