require 'rails_helper'

RSpec.describe AbilitiesController, type: :controller do
  it { is_expected.to route(:get, '/abilities').to(action: :index) }
  it { is_expected.to route(:get, '/abilities/1').to(action: :show, id: 1) }

  describe 'index' do
    before do
      get :index, format: :json
    end

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :index }
  end

  describe 'show' do
    before do
      get :show, id: ability_id, format: :json
    end

    context 'when the ability exists' do
      let(:ability) { FactoryGirl.create(:ability) }
      let(:ability_id) { ability.id }

      subject(:results) { JSON.parse(response.body) }

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :show }
      it { expect(results['id']).to eq(ability_id) }
      it { expect(results['name']).to eq(ability.name) }
    end

    context "when the ability doesn't exist" do
      let(:ability_id) { -9999 }

      it { is_expected.to respond_with :not_found }
    end
  end
end
