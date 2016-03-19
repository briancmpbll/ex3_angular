# Controller for character types.
class CharacterTypesController < ApplicationController
  before_action :set_character_type, only: [:show]

  def index
    @character_types = CharacterType.all
  end

  def show
  end

  private

  def set_character_type
    @character_type = CharacterType.find(params[:id])
  end

  def character_type_params
    params.require(:character_type).permit(:name)
  end
end
