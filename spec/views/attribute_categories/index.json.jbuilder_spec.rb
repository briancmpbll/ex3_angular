require 'rails_helper'

RSpec.describe 'attribute_categories/index.json.jbuilder', type: :view do
  before do
    assign(:attribute_categories, categories)
    render
  end

  let(:categories) { FactoryGirl.create_list(:category_with_attributes, 3) }

  include_context 'parse JSON'

  it 'should have the right number of attributes' do
    expect(results.length).to eq(categories.length)
  end

  it 'should include the category names' do
    categories.each do |category|
      expect(results[category.id.to_s]['name']).to eq(category.name)
    end
  end

  it 'should include the category attributes' do
    categories.each do |category|
      expect(results[category.id.to_s]['attributes']).not_to be_nil
    end
  end
end
