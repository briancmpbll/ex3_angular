# Model for character types. ie. Solar Exalted
class CharacterType < ActiveRecord::Base
  include Nameable
  include AnimaEffectOwner

  has_many :castes, dependent: :destroy
end
