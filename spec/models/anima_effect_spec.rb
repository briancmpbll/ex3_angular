require 'rails_helper'

RSpec.describe AnimaEffect, type: :model do
  it_should_behave_like 'a timestamped model'

  it { is_expected.to respond_to(:condition, :effect, :owner) }

  it { is_expected.to validate_presence_of(:condition) }
  it { is_expected.to validate_presence_of(:effect) }
  it { is_expected.to validate_presence_of(:owner) }

  it { is_expected.to belong_to(:owner) }
end
