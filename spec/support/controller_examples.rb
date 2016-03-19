shared_examples_for 'an index action' do |parent_name|
  before do
    if parent_name
      get :index, parent_name => parent_id, format: :json
    else
      get :index, format: :json
    end
  end

  let(:results) { JSON.parse(response.body) }

  it { is_expected.to respond_with :success }
  it { is_expected.to render_template :index }
  it { expect(results.length).to eq(collection.length) }
end

shared_examples_for 'a show action' do |name, fields|
  before do
    get :show, id: object_id, format: :json
  end

  context "when the #{name} exists" do
    let(:object) { FactoryGirl.create(name) }
    let(:object_id) { object.id }
    let(:results) { JSON.parse(response.body) }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :show }
    it { expect(results['id']).to eq(object_id) }

    if fields
      fields.each do |field|
        it { expect(results[field]).to eq(object[field]) }
      end
    end
  end

  context "when the #{name} doesn't exist" do
    let(:object_id) { -9999 }

    it { is_expected.to respond_with :not_found }
  end
end
