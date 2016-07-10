# Model for a character's specialty.
class Specialty < ActiveRecord::Base
  belongs_to :character_ability

  validates_presence_of :character_ability
  validates_presence_of :description
end
