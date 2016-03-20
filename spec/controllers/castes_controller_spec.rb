require 'rails_helper'

RSpec.describe CastesController, type: :controller do
  render_views

  it do
    is_expected.to route(:get, '/character_types/1/castes')
      .to(action: :index, character_type_id: 1)
  end
  it { is_expected.to route(:get, '/castes/1').to(action: :show, id: 1) }

  describe 'index' do
    before do
      @character_types = FactoryGirl.create_list(:character_type, 2)
      @castes = []
      @character_types.each do |type|
        @castes.concat FactoryGirl.create_list(:caste, 3, character_type: type)
      end
    end

    let(:collection) { @character_types[0].castes }
    let(:parent_id) { @character_types[0].id }

    it_should_behave_like 'a child index action', :character_type_id
  end

  describe 'show' do
    it_should_behave_like 'a show action', :caste, ['name']
  end
end
