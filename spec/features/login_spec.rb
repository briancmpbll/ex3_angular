require 'spec_helper'

feature 'Signing in', js: true do
  given(:user) { FactoryGirl.create(:user) }

  scenario 'Signing in with invalid credentials' do
    login('email@email.com', 'password')

    expect(page).to have_alert :danger
    expect(page).to have_content 'Invalid username/password combination.'
  end

  scenario 'Signing in with valid credentials' do
    login(user.email, user.password)

    expect(page).to have_alert :success
    expect(page).to have_content "Welcome back #{user.username}!"
    expect(page).to have_menu_for user
  end

  scenario 'Signing in, logging out, and signing in again' do
    login(user.email, user.password)
    expect(page).to have_menu_for user

    logout
    expect(page).to have_logged_out_menu

    login(user.email, user.password)
    expect(page).to have_menu_for user
  end
end
