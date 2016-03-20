require 'rails_helper'

RSpec.describe 'abilities/index.json.jbuilder', type: :view do
  let(:model_name) { :ability }

  it_should_behave_like 'an index view'
end
