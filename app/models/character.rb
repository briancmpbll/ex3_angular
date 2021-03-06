# Model for a character
class Character < ActiveRecord::Base
  self.per_page = 10

  belongs_to :caste
  has_one :character_type, through: :caste

  belongs_to :supernal_ability, class_name: 'Ability',
                                foreign_key: :supernal_ability_id

  has_many :character_abilities, dependent: :destroy
  has_many :character_attributes, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :caste

  validates_inclusion_of :willpower, in: 1..10
  validates_inclusion_of :essence, in: 1..5
end
