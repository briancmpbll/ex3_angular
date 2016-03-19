require 'rails_helper'

describe Attribute, type: :model do
  before do
    @attribute = FactoryGirl.create(:attribute)
  end

  it { is_expected.to respond_to(:name, :attribute_category, :created_at, :updated_at) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to belong_to :attribute_category }
end
