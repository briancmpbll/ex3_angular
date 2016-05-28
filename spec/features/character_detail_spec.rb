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
      expect(page).to have_content(character.caste.name)
      expect(page).to have_content(character.player)
      expect(page).to have_content(character.anima)
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
        character.character_abilities.each do |char_ability|
          ability = char_ability.ability
          selector = 'trait-control'
          selector +=
            if character.caste.abilities.include? ability
              '.caste-ability'
            else
              ':not(.caste-ability)'
            end

          within(selector, text: ability.name) do
            expect(page).to have_css(
              ".rating-control[aria-valuenow='#{char_ability.value}']"
            )

            expect(page).to have_field("#{ability.name}-checkbox",
                                       visible: false,
                                       disabled: true,
                                       checked: char_ability.favored)
          end
        end
      end
    end
  end
end
