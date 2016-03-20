# Controller for castes.
class CastesController < ApplicationController
  before_action :set_character_type, only: [:index]
  before_action :set_caste, only: [:show]

  def index
    @castes = @character_type.castes
  end

  def show
  end

  private

  def set_character_type
    @character_type = CharacterType.includes(:castes).find(params[:character_type_id])
  end

  def set_caste
    @caste = Caste.find(params[:id])
  end

  def caste_params
    params.require(:caste).permit(:name)
  end
end
