# Controller for attribute categories
class AttributeCategoriesController < ApplicationController
  before_action :set_attribute_category, only: [:show]

  def index
    @attribute_categories = AttributeCategory.all
  end

  def show
  end

  private

  def set_attribute_category
    @attribute_category = AttributeCategory.find(params[:id])
  end

  def attribute_category_params
    params.require(:ability).permit(:name)
  end
end
