require 'rails_helper'

RSpec.describe 'characters/show.json.jbuilder', type: :view do
  let(:model_name) { :character }

  include_context 'show view'

  it_should_behave_like 'a view of an id object'
  it_should_behave_like 'a view of a named object'

  it { is_expected.to render_template(partial: '_character') }

  subject(:abilities) { results['abilities'] }
  subject(:attributes) { results['attributes'] }

  it 'should include the right number of abilities' do
    expect(abilities.length).to eq(object.character_abilities.length)
  end

  it 'should include the right ability values' do
    object.character_abilities.each do |character_ability|
      result_value = abilities[character_ability.ability.id.to_s]['value']
      expect(result_value).to eq(character_ability.value)
    end
  end

  it 'should have the right favored abilities' do
    object.character_abilities.each do |character_ability|
      favored = abilities[character_ability.ability.id.to_s]['favored']
      expect(favored).to eq(character_ability.favored)
    end
  end

  it 'should include the right number of attributes' do
    expect(attributes.length).to eq(object.character_attributes.length)
  end

  it 'should include the right attribute values' do
    object.character_attributes.each do |character_attribute|
      result_value = attributes[character_attribute.attribute_data.id.to_s]
      expect(result_value).to eq(character_attribute.value)
    end
  end

  it 'should include the supernal ability' do
    expect(results['supernal_ability']).to eq(object.supernal_ability.id)
  end
end
