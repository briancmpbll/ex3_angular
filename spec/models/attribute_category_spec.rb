require 'rails_helper'

describe AttributeCategory, type: :model do
  before do
    @attribute_category = FactoryGirl.create(:attribute_category)
  end

  it { is_expected.to respond_to(:name, :created_at, :updated_at) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
end
