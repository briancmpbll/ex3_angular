require 'rails_helper'

RSpec.describe 'character_types/index.json.jbuilder', type: :view do
  let(:model_name) { :character_type }

  it_should_behave_like 'an index view'
end
