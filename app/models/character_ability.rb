# Model for a character's ability rating.
class CharacterAbility < ActiveRecord::Base
  belongs_to :character
  belongs_to :ability

  validates_presence_of :character
  validates_presence_of :ability

  validates_uniqueness_of :ability, scope: :character_id
  validates_uniqueness_of :character, scope: :ability_id

  validates_inclusion_of :value, in: 0..5
  validates_inclusion_of :favored, in: [true, false]
end
