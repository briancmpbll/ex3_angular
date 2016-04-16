require 'rails_helper'

feature 'the character detail page', js: true do
  background do
    Rails.application.load_seed
  end

  given(:character) { Character.first }
  given(:attributes) { Attribute.all }
  given(:abilities) { Ability.all }

  scenario 'showing the character details' do
    visit "#/characters/#{character.id}"

    within('concept-panel') do
      expect(page).to have_content(character.name)
      expect(page).to have_content(character.concept)
    end

    within 'attribute-panel .panel' do
      within '.panel-header' do
        expect(page).to have_text('Attributes')
      end

      within '.panel-body' do
        attributes.each do |attribute|
          expect(page).to have_selector('trait-control', text: attribute.name)
        end
      end
    end

    within 'ability-panel .panel' do
      within '.panel-header' do
        expect(page).to have_text('Abilities')
      end

      within '.panel-body' do
        abilities.each do |ability|
          expect(page).to have_selector('trait-control', text: ability.name)
        end
      end
    end
  end
end
