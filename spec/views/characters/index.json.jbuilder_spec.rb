require 'rails_helper'

RSpec.describe 'characters/index.json.jbuilder', type: :view do
  let(:model_name) { :character }

  before do
    assign(:characters, characters)
    assign(:total, characters.length)
    render
  end

  let(:characters) { FactoryGirl.create_list(:character, 5) }

  include_context 'parse JSON'

  it 'should have the right number of characters' do
    expect(results['characters']).to have_exactly(characters.length).items
  end

  it 'should have the right count' do
    expect(results['total']).to eq(characters.length)
  end
end
