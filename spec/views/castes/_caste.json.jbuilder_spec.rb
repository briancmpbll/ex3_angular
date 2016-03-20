require 'rails_helper'

RSpec.describe 'castes/_caste.json.jbuilder', type: :view do
  let(:model_name) { :caste }

  include_context 'partial'

  it_should_behave_like 'a view of an id object'
  it_should_behave_like 'a view of a named object'
end
