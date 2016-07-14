FactoryGirl.define do
  factory :merit do
    sequence(:name) { |i| "Merit #{i}" }
    valid_values [0, 1, 2, 3, 4, 5]
  end
end
