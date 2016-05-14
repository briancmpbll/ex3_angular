require 'rails_helper'

RSpec.describe 'castes/index.json.jbuilder', type: :view do
  before do
    assign(:castes, castes)
    render
  end

  let(:castes) { FactoryGirl.create_list(:caste, 5) }

  include_context 'parse JSON'

  it { is_expected.to render_template(partial: '_list') }

  it 'should have the right number of castes' do
    expect(results.length).to eq(castes.length)
  end
end
