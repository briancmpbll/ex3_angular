require 'rails_helper'

RSpec.describe 'attributes/show.json.jbuilder', type: :view do
  let(:model_name) { :attribute }

  include_context 'show view'

  it_should_behave_like 'a view of an id object'
  it_should_behave_like 'a view of a named object'
end
