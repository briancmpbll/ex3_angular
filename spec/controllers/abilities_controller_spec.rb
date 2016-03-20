require 'rails_helper'

RSpec.describe AbilitiesController, type: :controller do
  it { is_expected.to route(:get, '/abilities').to(action: :index) }
  it { is_expected.to route(:get, '/abilities/1').to(action: :show, id: 1) }

  it { is_expected.to use_before_action(:set_ability) }

  describe 'index' do
    it_should_behave_like 'a top level index action', :ability
  end

  describe 'show' do
    it_should_behave_like 'a show action', :ability
  end
end
