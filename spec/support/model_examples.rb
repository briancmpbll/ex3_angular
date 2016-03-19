shared_examples_for 'a named model' do
  it { is_expected.to respond_to :name }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
end

shared_examples_for 'a timestamped model' do
  it { is_expected.to respond_to(:created_at, :updated_at) }
end
