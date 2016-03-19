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
      @attribute_categories.each do |category|
        FactoryGirl.create_list(:attribute, 3, attribute_category: category)
      end
    end

    let(:results) { JSON.parse(response.body) }

    describe 'without a category' do
      before do
        get :index, format: :json
      end

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :index }
      it { expect(results.length).to eq(6) }
    end

    describe 'with a category' do
      before do
        get :index, attribute_category_id: @attribute_categories[0].id, format: :json
      end

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :index }
      it { expect(results.length).to eq(3) }
    end
  end

  describe 'show' do
    before do
      get :show, id: attribute_id, format: :json
    end

    context 'when the attribute exists' do
      let(:attribute) { FactoryGirl.create(:attribute) }
      let(:attribute_id) { attribute.id }
      let(:results) { JSON.parse(response.body) }

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :show }
      it { expect(results['id']).to eq(attribute_id) }
      it { expect(results['name']).to eq(attribute.name) }
    end

    context "when the attribute category doesn't exist" do
      let(:attribute_id) { -9999 }

      it { is_expected.to respond_with :not_found }
    end
  end
end
