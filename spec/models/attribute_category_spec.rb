require 'rails_helper'

RSpec.describe AttributeCategory, type: :model do
  before do
    @attribute_category = FactoryGirl.create(:attribute_category)
  end

  it { is_expected.to respond_to(:name, :child_attributes, :created_at, :updated_at) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to have_many(:child_attributes).dependent(:destroy) }
end
