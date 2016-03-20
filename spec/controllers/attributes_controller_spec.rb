require 'rails_helper'

RSpec.describe AttributesController, type: :controller do
  render_views

  it do
    is_expected.to route(:get, '/attribute_categories/1/attributes')
      .to(action: :index, attribute_category_id: 1)
  end
  it { is_expected.to route(:get, '/attributes').to(action: :index) }
  it { is_expected.to route(:get, '/attributes/1').to(action: :show, id: 1) }

  describe 'index' do
    before do
      @attribute_categories = FactoryGirl.create_list(:attribute_category, 2)
      @attributes = []
      @attribute_categories.each do |category|
        @attributes.concat FactoryGirl.create_list(:attribute, 3, attribute_category: category)
      end
    end

    describe 'without a category' do
      let(:collection) { @attributes }

      it_should_behave_like 'a top level index action'
    end

    describe 'with a category' do
      let(:collection) { @attribute_categories[0].child_attributes }
      let(:parent_id) { @attribute_categories[0].id }

      it_should_behave_like 'a child index action', :attribute_category_id
    end
  end

  describe 'show' do
    it_should_behave_like 'a show action', :attribute, ['name']
  end
end
