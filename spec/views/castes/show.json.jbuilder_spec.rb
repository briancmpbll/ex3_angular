require 'rails_helper'

RSpec.describe 'castes/show.json.jbuilder', type: :view do
  before do
    assign(:caste, caste)
    render
  end

  let(:caste) { FactoryGirl.create(:caste) }

  subject(:results) { JSON.parse(rendered) }

  it { expect(results['id']).to eq(caste.id) }
  it { expect(results['name']).to eq(caste.name) }
end
