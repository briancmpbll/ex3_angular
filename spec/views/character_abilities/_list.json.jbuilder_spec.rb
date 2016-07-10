require 'rails_helper'

RSpec.describe 'character_abilities/_list.json.jbuilder', type: :view do
  before do
    render partial: 'character_abilities/list',
           locals: { character_abilities: character_abilities }
  end

  let(:character_abilities) do
    FactoryGirl.create_list(:character_ability, 5)
  end

  include_context 'parse JSON'

  it 'should include the right number of abilities' do
    expect(results.length).to eq(character_abilities.length)
  end

  it 'should include the right ability values' do
    character_abilities.each do |character_ability|
      result_value = results[character_ability.ability.id.to_s]['value']
      expect(result_value).to eq(character_ability.value)
    end
  end

  it 'should have the right favored abilities' do
    character_abilities.each do |character_ability|
      favored = results[character_ability.ability.id.to_s]['favored']
      expect(favored).to eq(character_ability.favored)
    end
  end

  it 'should include the right specialties' do
    character_abilities.each do |character_ability|
      specialties = results[character_ability.ability.id.to_s]['specialties']
      expect(specialties).to have_specialties(character_ability.specialties)
    end
  end
end
