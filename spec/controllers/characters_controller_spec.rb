require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  it { is_expected.to route(:get, '/characters').to(action: :index) }
  it { is_expected.to route(:get, '/characters/1').to(action: :show, id: 1) }

  it { is_expected.to use_before_action(:set_character) }

  describe 'index' do
    let!(:characters) { FactoryGirl.create_list(:character, 5) }

    include_context 'top level index action'

    it 'should assign the right collection' do
      expect(assigns(:characters)).to eq(characters)
    end

    it 'should assign the right total' do
      expect(assigns(:total)).to eq(characters.length)
    end
  end

  describe 'show' do
    it_should_behave_like 'a show action', :character
  end
end
