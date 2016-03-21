require 'rails_helper'

RSpec.describe 'anima_effects/_anima_effect.json.jbuilder', type: :view do
  let(:model_name) { :anima_effect }
  let(:factory_name) { :caste_anima_effect }

  include_context 'partial'

  it { expect(results['condition']).to eq(object.condition) }
  it { expect(results['effect']).to eq(object.effect) }
end
