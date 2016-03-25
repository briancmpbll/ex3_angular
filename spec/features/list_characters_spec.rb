require 'rails_helper'

feature 'the character index', js: true do
  background do
    @characters = FactoryGirl.create_list(:character, 35)
  end

  scenario 'listing characters' do
    visit '#/characters'

    @characters.each do |character|
      expect(page).to have_text character.name
    end
  end
end
