require 'rails_helper'

RSpec.describe Specialty, type: :model do
  before do
    @specialty = FactoryGirl.create(:specialty)
  end

  it_should_behave_like 'a timestamped model'

  it { is_expected.to respond_to(:description, :character_ability) }

  it { is_expected.to belong_to :character_ability }

  it { is_expected.to validate_presence_of :character_ability }
  it { is_expected.to validate_presence_of :description }
end
