FactoryGirl.define do
  factory :character_merit do
    association :character
    association :merit
    value 1
    description 'MyString'
  end
end
