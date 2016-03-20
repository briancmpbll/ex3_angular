require 'rails_helper'

RSpec.describe 'abilities/_ability.json.jbuilder', type: :view do
  let(:model_name) { :ability }

  include_context 'partial'

  it_should_behave_like 'a view of an id object'
  it_should_behave_like 'a view of a named object'
end
