require 'rails_helper'

RSpec.describe AbilitiesController, type: :controller do
  render_views

  it { is_expected.to route(:get, '/abilities').to(action: :index) }
  it { is_expected.to route(:get, '/abilities/1').to(action: :show, id: 1) }

  describe 'index' do
    before do
      @abilities = FactoryGirl.create_list(:ability, 3)
      get :index, format: :json
    end

    let(:results) { JSON.parse(response.body) }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :index }
    it { expect(results.length).to eq(@abilities.length) }
  end

  describe 'show' do
    before do
      get :show, id: ability_id, format: :json
    end

    context 'when the ability exists' do
      let(:ability) { FactoryGirl.create(:ability) }
      let(:ability_id) { ability.id }
      let(:results) { JSON.parse(response.body) }

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
