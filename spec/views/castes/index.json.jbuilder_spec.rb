require 'rails_helper'

RSpec.describe 'castes/index.json.jbuilder', type: :view do
  before do
    assign(:castes, castes)
    render
  end

  let(:castes) { FactoryGirl.create_list(:caste, 3) }

  subject { JSON.parse(rendered) }

  it { is_expected.to have_exactly(castes.length).items }
end
