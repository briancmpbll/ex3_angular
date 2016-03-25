require 'rails_helper'

RSpec.describe 'characters/show.json.jbuilder', type: :view do
  let(:model_name) { :character }

  include_context 'show view'

  it_should_behave_like 'a view of an id object'
  it_should_behave_like 'a view of a named object'

  it { expect(results['concept']).to eq(object.concept) }
  it { expect(results['willpower']).to eq(object.willpower) }
  it { expect(results['essence']).to eq(object.essence) }

  it "should include the character's abilities" do
    expect(results['abilities'].length).to eq(object.character_abilities.length)
  end

  it "should include the character's attributes" do
    expect(results['attributes'].length).to eq(object
      .character_attributes.length)
  end
end
