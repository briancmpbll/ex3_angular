require 'rails_helper'

RSpec.describe AttributeCategoriesController, type: :controller do
  it { is_expected.to route(:get, '/attribute_categories').to(action: :index) }
  it { is_expected.to route(:get, '/attribute_categories/1').to(action: :show, id: 1) }

  it { is_expected.to use_before_action(:set_attribute_category) }

  describe 'index' do
    it_should_behave_like 'a top level index action', :attribute_category
  end

  describe 'show' do
    it_should_behave_like 'a show action', :attribute_category
  end
end
