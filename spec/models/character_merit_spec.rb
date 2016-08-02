require 'rails_helper'

RSpec.describe CharacterMerit, type: :model do
  before do
    @character_merit = FactoryGirl.create(:character_merit)
  end

  let(:merit) { FactoryGirl.create(:merit, valid_values: [1, 3, 5]) }

  it_should_behave_like 'a timestamped model'

  it { is_expected.to respond_to(:character, :merit, :value, :description) }

  it { is_expected.to validate_presence_of :character }
  it { is_expected.to validate_presence_of :merit }
  it { is_expected.to validate_presence_of :value }

  it 'should allow a value in the valid values' do
    valid_merit = FactoryGirl.build(:character_merit, value: 3, merit: merit)
    expect(valid_merit).to be_valid
  end

  it 'should not allow a value outside of valid values' do
    invalid_merit = FactoryGirl.build(:character_merit, value: 4,
                                                        merit: merit)
    expect(invalid_merit).not_to be_valid
  end
end
