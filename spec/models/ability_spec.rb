require 'rails_helper'

RSpec.describe Ability, type: :model do
  before do
    @ability = FactoryGirl.create(:ability)
  end

  it_should_behave_like 'a timestamped model'
  it_should_behave_like 'a named model'

  it { is_expected.to have_and_belong_to_many :castes }
end
