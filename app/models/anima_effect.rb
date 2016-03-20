# Model for anima effects.
class AnimaEffect < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  validates_presence_of :condition
  validates_presence_of :effect
  validates_presence_of :owner
end
