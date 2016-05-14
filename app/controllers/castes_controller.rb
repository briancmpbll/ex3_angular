# Controller for castes.
class CastesController < ApplicationController
  def index
    @castes = Caste.all
  end
end
