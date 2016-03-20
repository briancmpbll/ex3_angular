shared_context 'parse JSON' do
  subject(:results) { JSON.parse(rendered) }
end

shared_context 'single item view' do
  let(:object) { FactoryGirl.create(model_name) }
end

shared_examples_for 'an index view' do
  include_context 'parse JSON'

  before do
    assign(plural, collection)
    render
  end

  let(:plural) { model_name.to_s.pluralize }
  let(:collection) { FactoryGirl.create_list(model_name, 3) }

  it { is_expected.to have_exactly(collection.length).items }
end

shared_context 'show view' do
  include_context 'parse JSON'
  include_context 'single item view'

  before do
    assign(model_name, object)
    render
  end
end

shared_context 'partial' do
  include_context 'parse JSON'
  include_context 'single item view'

  before do
    render partial: partial_path, locals: { model_name => object }
  end

  let(:partial_path) { "#{model_name.to_s.pluralize}/#{model_name}" }
end

shared_examples_for 'a view of an id object' do
  it { expect(results['id']).to eq(object.id) }
end

shared_examples_for 'a view of a named object' do
  it { expect(results['name']).to eq(object.name) }
end