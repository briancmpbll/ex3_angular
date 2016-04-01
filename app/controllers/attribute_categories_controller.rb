# Controller for attribute categories
class AttributeCategoriesController < ApplicationController
  def index
    @attribute_categories = AttributeCategory.all.includes(:child_attributes)
  end
end
