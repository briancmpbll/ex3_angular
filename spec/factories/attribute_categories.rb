FactoryGirl.define do
  factory :attribute_category do
    sequence(:name) { |i| "AttributeCategory#{i}" }

    factory :category_with_attributes do
      transient do
        attribute_count 5
      end

      after(:create) do |category, evaluator|
        create_list(:attribute, evaluator.attribute_count,
                    attribute_category: category)
      end
    end
  end
end
