require 'rails_helper'

RSpec.describe Merit, type: :model do
  before do
    @merit = FactoryGirl.create(:merit)
  end

  it_should_behave_like 'a timestamped model'
  it_should_behave_like 'a uniquely named model'

  it { is_expected.to respond_to(:name, :valid_values) }
end
