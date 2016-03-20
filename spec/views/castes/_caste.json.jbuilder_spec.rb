require 'rails_helper'

RSpec.describe 'castes/_caste.json.jbuilder', type: :view do
  before do
    render partial: 'castes/caste', locals: { caste: caste }
  end

  let(:caste) { FactoryGirl.create(:caste) }

  subject(:results) { JSON.parse(rendered) }

  it { expect(results['id']).to eq(caste.id) }
  it { expect(results['name']).to eq(caste.name) }
end
