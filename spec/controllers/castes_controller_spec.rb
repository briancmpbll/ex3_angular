require 'rails_helper'

RSpec.describe CastesController, type: :controller do
  it { is_expected.to route(:get, '/castes').to(action: :index) }

  describe 'index' do
    it_should_behave_like 'a top level index action', :caste
  end
end
