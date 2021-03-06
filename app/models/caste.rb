# Model for castes.
class Caste < ActiveRecord::Base
  include Nameable
  include AnimaEffectOwner

  belongs_to :character_type
  has_and_belongs_to_many :abilities
end
