# Controller for characters.
class CharactersController < ApplicationController
  before_action :set_character, only: [:show]

  def index
    page = params[:page] || 1
    @characters = Character.includes(:caste).page(page).order(:name)
    @total = Character.all.count
  end

  def show
  end

  private

  def set_character
    @character = Character.includes(:caste,
                                    :supernal_ability,
                                    character_abilities: [:ability],
                                    character_attributes: [:attribute_data])
                          .find(params[:id])
  end
end
