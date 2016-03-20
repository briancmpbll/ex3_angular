require 'rails_helper'

RSpec.describe 'attribute_categories/show.json.jbuilder', type: :view do
  let(:model_name) { :attribute_category }

  include_context 'show view'

  it_should_behave_like 'a view of an id object'
  it_should_behave_like 'a view of a named object'
end
