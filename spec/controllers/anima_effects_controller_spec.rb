require 'rails_helper'

RSpec.describe AnimaEffectsController, type: :controller do
  it 'should route caste index correctly' do
    is_expected.to route(:get, '/castes/1/anima_effects')
      .to(action: :index, caste_id: 1)
  end

  it 'should route character type index correctly' do
    is_expected.to route(:get, '/character_types/1/anima_effects')
      .to(action: :index, character_type_id: 1)
  end

  it { is_expected.to route(:get, '/anima_effects/1').to(action: :show, id: 1) }

  it { is_expected.to use_before_action(:set_owner) }
  it { is_expected.to use_before_action(:set_anima_effect) }

  describe 'caste index' do
    it_should_behave_like 'a child index action', :anima_effect, :owner,
                          factory_name: :caste_anima_effect,
                          parent_factory_name: :caste
  end

  describe 'character type index' do
    it_should_behave_like 'a child index action', :anima_effect, :owner,
                          factory_name: :type_anima_effect,
                          parent_factory_name: :character_type
  end

  describe 'show' do
    it_should_behave_like 'a show action', :anima_effect,
                          factory_name: :caste_anima_effect
  end
end
