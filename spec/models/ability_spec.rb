require 'rails_helper'

RSpec.describe Ability, type: :model do
  before :each do
    @ability = FactoryGirl.create(:ability)
  end

  it { is_expected.to respond_to(:name, :created_at, :updated_at) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  # it { is_expected.to have_and_belong_to_many :castes }
end
