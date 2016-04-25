require 'rails_helper'

RSpec.describe 'castes/_list.json.jbuilder', type: :view do
  before do
    render partial: 'castes/list', locals: { castes: castes }
  end

  let(:castes) { FactoryGirl.create_list(:caste, 5) }

  include_context 'parse JSON'

  it 'should include the right number of castes' do
    expect(results.length).to eq(castes.length)
  end

  it 'should include the caste names' do
    castes.each do |caste|
      expect(results[caste.id.to_s]['name']).to eq(caste.name)
    end
  end

  it 'should include the caste icon' do
    castes.each do |caste|
      icon_regex = %r{/#{caste.name.downcase}24*\.png}
      expect(results[caste.id.to_s]['icon']).to match icon_regex
    end
  end
end
