# Controller for Abilities
class AbilitiesController < ApplicationController
  before_action :set_ability, only: [:show]

  def index
    @abilities = Ability.all
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_ability
    @ability = Ability.find(params[:id])
  end

  def ability_params
    params.require(:ability).permit(:name)
  end
end
