require 'rails_helper'

RSpec.describe 'attributes/index.json.jbuilder', type: :view do
  let(:model_name) { :attribute }

  it_should_behave_like 'an index view'
end
