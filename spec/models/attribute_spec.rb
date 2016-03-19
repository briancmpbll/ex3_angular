require 'rails_helper'

RSpec.describe Attribute, type: :model do
  before do
    @attribute = FactoryGirl.create(:attribute)
  end

  it_should_behave_like 'a timestamped model'
  it_should_behave_like 'a named model'

  it { is_expected.to respond_to(:attribute_category) }
  it { is_expected.to belong_to :attribute_category }
  it { is_expected.to validate_presence_of :attribute_category }
end
