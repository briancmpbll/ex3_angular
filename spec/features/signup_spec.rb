require 'spec_helper'

feature 'signing up', js: true do
  given(:new_user) { FactoryGirl.build(:user) }
  given(:existing_user) { FactoryGirl.create(:user) }

  def sign_up_and_expect_alert(user, expected_alert)
    signup_as user
    expect(page).to have_alert :danger
    expect(page).to have_content expected_alert
  end

  scenario 'with valid information' do
    signup_as new_user

    expect(page).to have_menu_for new_user
    expect(current_path_info).to be_index_path
  end

  scenario 'with a short password' do
    bad_user = FactoryGirl.build(:user, password: 'test', password_confirmation: 'test')
    sign_up_and_expect_alert bad_user, 'Password is too short'
  end

  scenario 'with a bad password confirmation' do
    bad_user = FactoryGirl.build(:user, password_confirmation: '1234abcd')
    sign_up_and_expect_alert bad_user, "Password Confirmation doesn't match Password"
  end

  scenario 'with an existing email' do
    bad_user = FactoryGirl.build(:user, email: existing_user.email)
    sign_up_and_expect_alert bad_user, 'Email has already been taken'
  end

  scenario 'with an existing username' do
    bad_user = FactoryGirl.build(:user, username: existing_user.username)
    sign_up_and_expect_alert bad_user, 'Username has already been taken'
  end
end
