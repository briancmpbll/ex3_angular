require 'rails_helper'

RSpec.describe AttributeCategory, type: :model do
  before do
    @attribute_category = FactoryGirl.create(:attribute_category)
  end

  it_should_behave_like 'a timestamped model'
  it_should_behave_like 'a uniquely named model'

  it { is_expected.to respond_to(:child_attributes) }
  it { is_expected.to have_many(:child_attributes).dependent(:destroy) }
end
