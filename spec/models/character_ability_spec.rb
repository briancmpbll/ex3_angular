require 'rails_helper'

RSpec.describe CharacterAbility, type: :model do
  before do
    @character_ability = FactoryGirl.create(:character_ability)
  end

  it_should_behave_like 'a timestamped model'

  it 'should respond to fields' do
    is_expected.to respond_to(:character, :ability, :value, :favored)
  end

  it { is_expected.to validate_presence_of :character }
  it { is_expected.to validate_presence_of :ability }

  # it { is_expected.to validate_inclusion_of(:favored).in_array([true, false]) }
  it { is_expected.to validate_inclusion_of(:value).in_range(0..5) }

  it 'should only allow one rating for each ability on a character' do
    is_expected.to validate_uniqueness_of(:ability).scoped_to(:character_id)
    is_expected.to validate_uniqueness_of(:character).scoped_to(:ability_id)
  end
end
