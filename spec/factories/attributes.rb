FactoryGirl.define do
  factory :attribute do
    sequence(:name) { |i| "Attribute#{i}" }
    association :attribute_category
  end
end
