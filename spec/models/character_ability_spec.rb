require 'rails_helper'

RSpec.describe CharacterAbility, type: :model do
  it_should_behave_like 'a timestamped model'

  it 'should respond to fields' do
    is_expected.to respond_to(:character, :ability, :value)
  end

  it { is_expected.to validate_presence_of :character }
  it { is_expected.to validate_presence_of :ability }

  it { is_expected.to validate_inclusion_of(:value).in_range(0..5) }
end
