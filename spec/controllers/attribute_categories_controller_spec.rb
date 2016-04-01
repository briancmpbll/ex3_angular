require 'rails_helper'

RSpec.describe AttributeCategoriesController, type: :controller do
  it { is_expected.to route(:get, '/attribute_categories').to(action: :index) }

  describe 'index' do
    it_should_behave_like 'a top level index action', :attribute_category
  end
end
