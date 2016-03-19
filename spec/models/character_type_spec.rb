require 'rails_helper'

RSpec.describe CharacterType, type: :model do
  before do
    @character_type = FactoryGirl.create(:character_type)
  end

  it { is_expected.to respond_to(:name, :created_at, :updated_at) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
end
