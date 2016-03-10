require 'spec_helper'

feature 'the login process', js: true do
  scenario 'submitting form with no input' do
    visit '#/login'

    within('.container') do
      click_on 'Log In'
    end

    expect(page).to have_content 'Invalid username/password combination.'
  end
end
