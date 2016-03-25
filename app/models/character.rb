# Model for a character
class Character < ActiveRecord::Base
  belongs_to :caste
  has_one :character_type, through: :caste

  has_many :character_abilities, dependent: :destroy
  has_many :character_attributes, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :caste

  validates_inclusion_of :willpower, in: 1..10
  validates_inclusion_of :essence, in: 1..5
end
