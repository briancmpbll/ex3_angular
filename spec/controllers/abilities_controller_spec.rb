require 'rails_helper'

RSpec.describe AbilitiesController, type: :controller do
  render_views

  it { is_expected.to route(:get, '/abilities').to(action: :index) }
  it { is_expected.to route(:get, '/abilities/1').to(action: :show, id: 1) }

  describe 'index' do
    let!(:collection) { FactoryGirl.create_list(:ability, 3) }

    it_should_behave_like 'an index action'
  end

  describe 'show' do
    it_should_behave_like 'a show action', :ability, ['name']
  end
end
