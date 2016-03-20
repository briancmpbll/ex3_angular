# Controller for attributes
class AttributesController < ApplicationController
  before_action :set_attribute_category, only: [:index]
  before_action :set_attribute, only: [:show]

  def index
    @attributes = @attribute_category.child_attributes if @attribute_category
    @attributes ||= Attribute.all
  end

  def show
  end

  private

  def set_attribute_category
    attribute_category_id = params[:attribute_category_id]
    if attribute_category_id
      @attribute_category = AttributeCategory.includes(:child_attributes)
                                             .find(attribute_category_id)
    end
  end

  def set_attribute
    @attribute = Attribute.find(params[:id])
  end

  def attribute_params
    params.require(:attribute).permit(:name)
  end
end
