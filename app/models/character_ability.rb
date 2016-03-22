class CharacterAbility < ActiveRecord::Base
  belongs_to :character
  belongs_to :ability

  validates_presence_of :character
  validates_presence_of :ability

  validates_inclusion_of :value, in: 0..5
end
