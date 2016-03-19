require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to(:email, :username) }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  it { is_expected.to validate_presence_of :username }
  it { is_expected.to validate_uniqueness_of(:username).case_insensitive }

  it { is_expected.to allow_value('test@test.com').for(:email) }
  it { is_expected.to_not allow_value('test').for(:email) }
  it { is_expected.to_not allow_value('test@test').for(:email) }
  it { is_expected.to_not allow_value('test.com').for(:email) }

  it 'is expected to convert email to lower case before saving' do
    email = 'EmAil@EmAiL.Com'
    new_user = FactoryGirl.build(:user, email: email)
    new_user.save
    expect(new_user.email).to eq(email.downcase)
  end
end
