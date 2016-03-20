require 'rails_helper'

RSpec.describe 'castes/index.json.jbuilder', type: :view do
  let(:model_name) { :caste }

  it_should_behave_like 'an index view'
end
