require 'rails_helper'

RSpec.describe CharacterTypesController, type: :controller do
  render_views

  it { is_expected.to route(:get, '/character_types').to(action: :index) }
  it { is_expected.to route(:get, '/character_types/1').to(action: :show, id: 1) }

  describe 'index' do
    let!(:collection) { FactoryGirl.create_list(:character_type, 3) }

    it_should_behave_like 'an index action'
  end

  describe 'show' do
    it_should_behave_like 'a show action', :character_type, ['name']
  end
end
