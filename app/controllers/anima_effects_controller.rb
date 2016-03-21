# Controller for anima effects.
class AnimaEffectsController < ApplicationController
  before_action :set_owner, only: [:index]
  before_action :set_anima_effect, only: [:show]

  def index
    @anima_effects = @owner.anima_effects
  end

  def show
  end

  private

  def set_owner
    @owner = Caste.includes(:anima_effects)
                  .find(params[:caste_id]) if params[:caste_id]
    @owner ||= CharacterType.includes(:anima_effects)
                            .find(params[:character_type_id])
  end

  def set_anima_effect
    @anima_effect = AnimaEffect.find(params[:id])
  end
end
