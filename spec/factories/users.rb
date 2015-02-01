FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Comment#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'please123'
    trait :admin do
      role 'admin'
    end
  end
end
