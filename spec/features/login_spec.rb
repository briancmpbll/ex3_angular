require 'spec_helper'

feature 'Signing in', js: true do
  given(:user) { FactoryGirl.create(:user) }

  def login(email, password)
    visit '#/login'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log In'
  end

  scenario 'Signing in with invalid credentials' do
    login('email@email.com', 'password')

    expect(page).to have_selector '.alert-danger'
    expect(page).to have_content 'Invalid username/password combination.'
  end

  scenario 'Signing in with valid credentials' do
    login(user.email, user.password)

    expect(page).to have_selector '.alert-success'
    expect(page).to have_content "Welcome back #{user.username}!"
    expect(page.find('.navbar-right')).to have_content user.username
  end

  scenario 'Signing in, logging out, and signing in again' do
    login(user.email, user.password)
    expect(page.find('.navbar-right')).to have_content user.username

    click_link user.username
    click_on 'Log Out'
    expect(page.find('.navbar-right')).to have_content 'Log In'

    login(user.email, user.password)
    expect(page.find('.navbar-right')).to have_content user.username
  end
end
