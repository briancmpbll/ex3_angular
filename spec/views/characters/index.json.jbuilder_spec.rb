require 'rails_helper'

RSpec.describe 'characters/index.json.jbuilder', type: :view do
  let(:model_name) { :character }

  it_should_behave_like 'an index view'
end
