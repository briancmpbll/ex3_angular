# Model for merit types.
class Merit < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :valid_values

  validates_inclusion_of :repeatable, in: [true, false]

  validates_uniqueness_of :name
end
