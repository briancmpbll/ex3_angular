require 'rails_helper'

RSpec.describe 'character_types/index.json.jbuilder', type: :view do
  before do
    assign(:character_types, character_types)
    render
  end

  let(:character_types) do
    FactoryGirl.create_list(:character_type_with_castes, 3)
  end

  include_context 'parse JSON'

  it { is_expected.to render_template(partial: 'castes/_list') }

  it 'should have the right number of character types' do
    expect(results.length).to eq(character_types.length)
  end

  it 'should include the character type names' do
    character_types.each do |character_type|
      expect(results[character_type.id.to_s]['name']).to eq(character_type.name)
    end
  end

  it 'should include the character type castes' do
    character_types.each do |character_type|
      expect(results[character_type.id.to_s]['castes']).not_to be_nil
    end
  end
end
