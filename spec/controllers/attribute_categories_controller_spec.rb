require 'rails_helper'

RSpec.describe AttributeCategoriesController, type: :controller do
  render_views

  it { is_expected.to route(:get, '/attribute_categories').to(action: :index) }
  it { is_expected.to route(:get, '/attribute_categories/1').to(action: :show, id: 1) }

  describe 'index' do
    let!(:collection) { FactoryGirl.create_list(:attribute_category, 3) }

    it_should_behave_like 'an index action'
  end

  describe 'show' do
    it_should_behave_like 'a show action', :attribute_category, ['name']
  end
end
