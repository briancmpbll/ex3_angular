require 'rails_helper'

RSpec.describe Caste, type: :model do
  before do
    @caste = FactoryGirl.create(:caste)
  end

  it_should_behave_like 'a timestamped model'
  it_should_behave_like 'a named model'
  it_should_behave_like 'an anima effect owner'

  it { is_expected.to respond_to(:character_type) }
  it { is_expected.to belong_to :character_type }
  it { is_expected.to have_and_belong_to_many :abilities }
end
