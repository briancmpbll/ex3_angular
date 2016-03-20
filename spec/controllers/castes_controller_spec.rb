require 'rails_helper'

RSpec.describe CastesController, type: :controller do
  it do
    is_expected.to route(:get, '/character_types/1/castes')
      .to(action: :index, character_type_id: 1)
  end
  it { is_expected.to route(:get, '/castes/1').to(action: :show, id: 1) }

  it { is_expected.to use_before_action(:set_character_type) }
  it { is_expected.to use_before_action(:set_caste) }

  describe 'index' do
    it_should_behave_like 'a child index action', :caste, :character_type
  end

  describe 'show' do
    it_should_behave_like 'a show action', :caste
  end
end
