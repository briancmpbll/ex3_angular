require 'rails_helper'

RSpec.describe 'characters/show.json.jbuilder', type: :view do
  let(:model_name) { :character }

  include_context 'show view'

  it_should_behave_like 'a view of an id object'
  it_should_behave_like 'a view of a named object'

  it { expect(results['concept']).to eq(object.concept) }
  it { expect(results['willpower']).to eq(object.willpower) }
  it { expect(results['essence']).to eq(object.essence) }

  subject(:abilities) { results['abilities'] }
  subject(:attributes) { results['attributes'] }

  it 'should include the right number of abilities' do
    expect(abilities.length).to eq(object.character_abilities.length)
  end

  it 'should include the right ability values' do
    object.character_abilities.each do |character_ability|
      result_value = abilities[character_ability.ability.id.to_s]
      expect(result_value).to eq(character_ability.value)
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
end
