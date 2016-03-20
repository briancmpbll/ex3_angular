require 'rails_helper'

RSpec.describe AttributesController, type: :controller do
  it do
    is_expected.to route(:get, '/attribute_categories/1/attributes')
      .to(action: :index, attribute_category_id: 1)
  end
  it { is_expected.to route(:get, '/attributes').to(action: :index) }
  it { is_expected.to route(:get, '/attributes/1').to(action: :show, id: 1) }

  it { is_expected.to use_before_action(:set_attribute_category) }
  it { is_expected.to use_before_action(:set_attribute) }

  describe 'index' do
    describe 'without a category' do
      it_should_behave_like 'a top level index action', :attribute
    end

    describe 'with a category' do
      it_should_behave_like 'a child index action', :attribute, :attribute_category
    end
  end

  describe 'show' do
    it_should_behave_like 'a show action', :attribute
  end
end
