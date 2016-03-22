require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  it { is_expected.to route(:get, '/characters').to(action: :index) }
  it { is_expected.to route(:get, '/characters/1').to(action: :show, id: 1) }

  it { is_expected.to use_before_action(:set_character) }

  describe 'index' do
    it_should_behave_like 'a top level index action', :character
  end

  describe 'show' do
    it_should_behave_like 'a show action', :character
  end
end
