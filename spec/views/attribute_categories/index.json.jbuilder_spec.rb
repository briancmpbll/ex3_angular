require 'rails_helper'

RSpec.describe 'attribute_categories/index.json.jbuilder', type: :view do
  let(:model_name) { :attribute_category }

  it_should_behave_like 'an index view'
end
