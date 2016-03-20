require 'rails_helper'

RSpec.describe CharacterTypesController, type: :controller do
  it { is_expected.to route(:get, '/character_types').to(action: :index) }
  it { is_expected.to route(:get, '/character_types/1').to(action: :show, id: 1) }

  describe 'index' do
    it_should_behave_like 'a top level index action', :character_type
  end

  describe 'show' do
    it_should_behave_like 'a show action', :character_type
  end
end
