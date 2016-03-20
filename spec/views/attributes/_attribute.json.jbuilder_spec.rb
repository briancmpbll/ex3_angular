require 'rails_helper'

RSpec.describe 'attributes/_attribute.json.jbuilder', type: :view do
  let(:model_name) { :attribute }

  include_context 'partial'

  it_should_behave_like 'a view of an id object'
  it_should_behave_like 'a view of a named object'
end
