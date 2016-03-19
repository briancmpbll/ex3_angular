require 'rails_helper'

RSpec.describe AttributeCategoriesController, type: :controller do
  render_views

  it { is_expected.to route(:get, '/attribute_categories').to(action: :index) }
  it { is_expected.to route(:get, '/attribute_categories/1').to(action: :show, id: 1) }

  describe 'index' do
    before do
      @attribute_categories = FactoryGirl.create_list(:attribute_category, 3)
      get :index, format: :json
    end

    let(:results) { JSON.parse(response.body) }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :index }
    it { expect(results.length).to eq(@attribute_categories.length) }
  end

  describe 'show' do
    before do
      get :show, id: attribute_category_id, format: :json
    end

    context 'when the attribute category exists' do
      let(:attribute_category) { FactoryGirl.create(:attribute_category) }
      let(:attribute_category_id) { attribute_category.id }
      let(:results) { JSON.parse(response.body) }

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :show }
      it { expect(results['id']).to eq(attribute_category_id) }
      it { expect(results['name']).to eq(attribute_category.name) }
    end

    context "when the attribute category doesn't exist" do
      let(:attribute_category_id) { -9999 }

      it { is_expected.to respond_with :not_found }
    end
  end
end
