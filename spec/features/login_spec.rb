require 'spec_helper'

feature 'logging in', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given(:invalid_user) { FactoryGirl.build(:user) }

  scenario 'with invalid credentials' do
    login_as invalid_user

    expect(page).to have_alert :danger
    expect(page).to have_content 'Invalid username/password combination.'
  end

  scenario 'with valid credentials' do
    login_as user

    expect(page).to have_alert :success
    expect(page).to have_content "Welcome back #{user.username}!"
    expect(page).to have_menu_for user
    expect(current_path_info).to be_index_path
  end

  scenario 'then logging out, and logging in again' do
    login_as user
    expect(page).to have_menu_for user

    logout
    expect(page).to have_logged_out_menu

    login_as user
    expect(page).to have_menu_for user
  end
end
