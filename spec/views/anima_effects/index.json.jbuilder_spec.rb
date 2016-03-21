require 'rails_helper'

RSpec.describe 'anima_effects/index.json.jbuilder', type: :view do
  let(:model_name) { :anima_effect }
  let(:factory_name) { :caste_anima_effect }

  it_should_behave_like 'an index view'
end
