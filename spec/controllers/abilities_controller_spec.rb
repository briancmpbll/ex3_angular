require 'rails_helper'

RSpec.describe AbilitiesController, type: :controller do
  it { is_expected.to route(:get, '/abilities').to(action: :index) }

  describe 'index' do
    it_should_behave_like 'a top level index action', :ability
  end
end
