require 'rails_helper'

feature 'the character index', js: true do
  background do
    Rails.application.load_seed
  end

  given(:characters) { Character.all.order(:name) }

  scenario 'listing characters' do
    visit '#/characters'

    expect(page.find('ui-view h1')).to have_text 'Characters'

    expect(page).to have_character_links(characters[0, 10])

    first('.pagination').click_link('2')
    expect(page).to have_character_links(characters[10, 10])

    page.driver.go_back
    expect(page).to have_character_links(characters[0, 10])

    page.driver.go_forward
    expect(page).to have_character_links(characters[10, 10])
  end
end
