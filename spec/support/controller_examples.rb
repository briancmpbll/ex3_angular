shared_context 'top level index action' do
  before do
    get :index, format: :json
  end
end

shared_examples_for 'an index action' do |name|
  let(:collection_name) { name.to_s.pluralize }

  it { is_expected.to respond_with :success }
  it { is_expected.to render_template :index }

  it 'should assign the right collection' do
    expect(assigns(collection_name)).to eq(collection)
  end
end

shared_examples_for 'a top level index action' do |name|
  let!(:collection) { FactoryGirl.create_list(name, 3) }

  include_context 'top level index action'

  it_should_behave_like 'an index action', name
end

shared_examples_for 'a child index action' do |name, parent_name, options|
  let(:factory_name) do
    return options[:factory_name] if options && options[:factory_name]
    name
  end
  let(:parent_factory_name) do
    return options[:parent_factory_name] if options &&
                                            options[:parent_factory_name]
    parent_name
  end

  let!(:parents) { FactoryGirl.create_list(parent_factory_name, 3) }
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
    get :index, "#{parent_factory_name}_id" => parent_id, format: :json
  end

  it 'should assign the right parent' do
    expect(assigns(parent_name)).to eq(parents[0])
  end

  it_should_behave_like 'an index action', name
end

shared_examples_for 'a show action' do |name, options|
  let(:factory_name) do
    return options[:factory_name] if options && options[:factory_name]
    name
  end

  before do
    get :show, id: object_id, format: :json
  end

  context "when the #{name} exists" do
    let(:object) { FactoryGirl.create(factory_name) }
    let(:object_id) { object.id }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :show }
    it 'should assign the right object' do
      expect(assigns(name)).to eq(object)
    end
  end

  context "when the #{name} doesn't exist" do
    let(:object_id) { -9999 }

    it { is_expected.to respond_with :not_found }
  end
end
