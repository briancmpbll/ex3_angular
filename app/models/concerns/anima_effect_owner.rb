# Concern for models that own anima effects.
module AnimaEffectOwner
  extend ActiveSupport::Concern

  included do
    has_many :anima_effects, as: :owner, dependent: :destroy
  end
end
