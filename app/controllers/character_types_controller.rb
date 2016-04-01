# Controller for character types.
class CharacterTypesController < ApplicationController
  def index
    @character_types = CharacterType.all
  end
end
