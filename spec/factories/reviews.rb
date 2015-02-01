FactoryGirl.define do
  factory :review do
    article { create(:article) }
    sequence(:comment) { |n| "Comment#{n}" }
    decision 1
  end
end
