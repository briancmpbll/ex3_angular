require 'rails_helper'

RSpec.describe CharacterType, type: :model do
  before do
    @character_type = FactoryGirl.create(:character_type)
  end

  it_should_behave_like 'a timestamped model'
  it_should_behave_like 'a named model'

  it { is_expected.to respond_to(:castes) }
  it { is_expected.to have_many(:castes).dependent(:destroy) }
end
