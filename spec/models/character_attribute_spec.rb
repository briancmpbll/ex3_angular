require 'rails_helper'

RSpec.describe CharacterAttribute, type: :model do
  before do
    @character_attribute = FactoryGirl.create(:character_attribute)
  end

  it_should_behave_like 'a timestamped model'

  it 'should respond to fields' do
    is_expected.to respond_to(:character, :attribute_data, :value)
  end

  it { is_expected.to validate_presence_of :character }
  it { is_expected.to validate_presence_of :attribute_data }
  it { is_expected.to validate_presence_of :value }

  it { is_expected.to validate_inclusion_of(:value).in_range(0..5) }

  it 'should only allow one rating for each attribute on a character' do
    is_expected.to validate_uniqueness_of(:attribute_data)
      .scoped_to(:character_id)
    is_expected.to validate_uniqueness_of(:character)
      .scoped_to(:attribute_id)
  end
end
