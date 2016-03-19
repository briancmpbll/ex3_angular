require 'rails_helper'

RSpec.describe CharacterTypesController, type: :controller do
  render_views

  it { is_expected.to route(:get, '/character_types').to(action: :index) }
  it { is_expected.to route(:get, '/character_types/1').to(action: :show, id: 1) }

  describe 'index' do
    before do
      @character_types = FactoryGirl.create_list(:character_type, 3)
      get :index, format: :json
    end

    let(:results) { JSON.parse(response.body) }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :index }
    it { expect(results.length).to eq(@character_types.length) }
  end

  describe 'show' do
    before do
      get :show, id: character_type_id, format: :json
    end

    context 'when the character type exists' do
      let(:character_type) { FactoryGirl.create(:character_type) }
      let(:character_type_id) { character_type.id }
      let(:results) { JSON.parse(response.body) }

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :show }
      it { expect(results['id']).to eq(character_type_id) }
      it { expect(results['name']).to eq(character_type.name) }
    end

    context "when the attribute category doesn't exist" do
      let(:character_type_id) { -9999 }

      it { is_expected.to respond_with :not_found }
    end
  end
end
