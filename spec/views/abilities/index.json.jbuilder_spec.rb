require 'rails_helper'

RSpec.describe 'abilities/index.json.jbuilder', type: :view do
  before do
    assign(:abilities, abilities)
    render
  end

  let(:abilities) { FactoryGirl.create_list(:ability, 6) }

  include_context 'parse JSON'

  it 'should have the right number of abilities' do
    expect(results.length).to eq(abilities.length)
  end

  it 'should include the attribute names' do
    abilities.each do |ability|
      expect(results[ability.id.to_s]).to eq(ability.name)
    end
  end
end
