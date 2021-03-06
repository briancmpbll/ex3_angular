require 'rails_helper'

RSpec.describe 'characters/_character.json.jbuilder', type: :view do
  let(:model_name) { :character }

  include_context 'partial'

  it_should_behave_like 'a view of an id object'
  it_should_behave_like 'a view of a named object'

  it { expect(results['concept']).to eq(object.concept) }
  it { expect(results['willpower']).to eq(object.willpower) }
  it { expect(results['essence']).to eq(object.essence) }
  it { expect(results['caste']).to eq(object.caste.id) }
  it { expect(results['player']).to eq(object.player) }
  it { expect(results['anima']).to eq(object.anima) }
end
