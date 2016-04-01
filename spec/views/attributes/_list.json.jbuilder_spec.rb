require 'rails_helper'

RSpec.describe 'attributes/_list.json.jbuilder', type: :view do
  before do
    render partial: 'attributes/list', locals: { attributes: attributes }
  end

  let(:attributes) { FactoryGirl.create_list(:attribute, 4) }

  include_context 'parse JSON'

  it 'should include the right number of attributes' do
    expect(results.length).to eq(attributes.length)
  end

  it 'should include the attribute names' do
    attributes.each do |attribute|
      expect(results[attribute.id.to_s]).to eq(attribute.name)
    end
  end
end
