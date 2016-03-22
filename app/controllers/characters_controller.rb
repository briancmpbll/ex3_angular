# Controller for characters.
class CharactersController < ApplicationController
  before_action :set_character, only: [:show]

  def index
    @characters = Character.all
  end

  def show
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end
end
