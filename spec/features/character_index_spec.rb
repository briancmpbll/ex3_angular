require 'rails_helper'

feature 'the character index', js: true do
  background do
    Rails.application.load_seed
  end

  scenario 'listing characters' do
    visit '#/characters'

    expect(page.find('ui-view h1')).to have_text 'Characters'

    Character.all.each do |character|
      within '.index-list' do
        expect(page).to have_link character.name,
                                  href: "#/characters/#{character.id}"
      end
    end
  end
end
