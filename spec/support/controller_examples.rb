shared_examples_for 'an index action' do |name|
  let(:collection_name) { name.to_s.pluralize }

  it { is_expected.to respond_with :success }
  it { is_expected.to render_template :index }

  it { expect(assigns(collection_name)).to eq(collection) }
end

shared_examples_for 'a top level index action' do |name|
  let!(:collection) { FactoryGirl.create_list(name, 3) }

  before do
    get :index, format: :json
  end

  it_should_behave_like 'an index action', name
end

shared_examples_for 'a child index action' do |name, parent_name|
  let!(:parents) { FactoryGirl.create_list(parent_name, 3) }
  let!(:children) do
    children = []
    parents.each do |parent|
      children.push FactoryGirl.create_list(name, 3, parent_name => parent)
    end
    children
  end
  let(:parent_id) { parents[0].id }
  let(:collection) { children[0] }

  before do
    get :index, "#{parent_name}_id" => parent_id, format: :json
  end

  it { expect(assigns(parent_name)).to eq(parents[0]) }

  it_should_behave_like 'an index action', name
end

shared_examples_for 'a show action' do |name|
  before do
    get :show, id: object_id, format: :json
  end

  context "when the #{name} exists" do
    let(:object) { FactoryGirl.create(name) }
    let(:object_id) { object.id }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :show }
    it { expect(assigns(name)).to eq(object) }
  end

  context "when the #{name} doesn't exist" do
    let(:object_id) { -9999 }

    it { is_expected.to respond_with :not_found }
  end
end
