require 'spec_helper'

feature 'signing up', js: true do
  given(:new_user) { FactoryGirl.build(:user) }
  given(:existing_user) { FactoryGirl.create(:user) }

  scenario 'with valid information' do
    signup_as new_user

    expect(page).to have_menu_for new_user
    expect(current_path_info).to be_index_path
  end
end
