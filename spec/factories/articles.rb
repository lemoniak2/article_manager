FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Article#{n}" }
    sequence(:summary) { |n| "Article#{n}" }
    keywords '#keywordx'
    user { create(:user) }
  end
end
