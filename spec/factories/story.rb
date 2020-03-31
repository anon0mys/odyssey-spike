FactoryBot.define do
  factory :story do
    sequence(:name) { |n| "Story #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    association :user
  end
end
