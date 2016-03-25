require 'rails_helper'

RSpec.describe Character, type: :model do
  it_should_behave_like 'a timestamped model'
  it_should_behave_like 'a named model'

  it 'should respond to fields' do
    is_expected.to respond_to(:concept, :caste, :willpower, :essence,
                              :character_type, :character_abilities,
                              :character_attributes)
  end

  it { is_expected.to validate_presence_of :caste }

  it { is_expected.to belong_to :caste }
  it { is_expected.to have_one(:character_type).through(:caste) }

  it { is_expected.to have_many(:character_abilities).dependent(:destroy) }
  it { is_expected.to have_many(:character_attributes).dependent(:destroy) }

  it { is_expected.to validate_inclusion_of(:willpower).in_range(1..10) }
  it { is_expected.to validate_inclusion_of(:essence).in_range(1..5) }
end
