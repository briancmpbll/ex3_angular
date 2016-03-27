require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  it { is_expected.to route(:get, '/characters').to(action: :index) }
  it { is_expected.to route(:get, '/characters/1').to(action: :show, id: 1) }

  it { is_expected.to use_before_action(:set_character) }

  describe 'index' do
    let!(:characters) do
      FactoryGirl.create_list(:character, 15)
      Character.all.order(:name)
    end

    describe 'without a page specified' do
      before do
        get :index, format: :json
      end

      it 'should assign the first page' do
        expect(assigns(:characters)).to eq(characters[0, 10])
      end

      it 'should assign the right total' do
        expect(assigns(:total)).to eq(characters.length)
      end
    end

    describe 'with a page specified' do
      before do
        get :index, format: :json, page: 2
      end

      it 'should assign the specified page' do
        expect(assigns(:characters)).to eq(characters[10, 10])
      end

      it 'should assign the right total' do
        expect(assigns(:total)).to eq(characters.length)
      end
    end
  end

  describe 'show' do
    it_should_behave_like 'a show action', :character
  end
end
