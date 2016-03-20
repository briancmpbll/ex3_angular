require 'rails_helper'

RSpec.describe 'character_types/_character_type.json.jbuilder', type: :view do
  let(:model_name) { :character_type }

  include_context 'partial'

  it_should_behave_like 'a view of an id object'
  it_should_behave_like 'a view of a named object'
end
