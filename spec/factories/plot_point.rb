FactoryBot.define do
  factory :plot_point do
    sequence(:name) { |n| "Plot Point #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    visibility_radius { 0 }
    latitude { 0.0 }
    longitude { 0.0 }
    association :story
  end
end
