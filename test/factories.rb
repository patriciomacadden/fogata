FactoryGirl.define do
  factory :channel do
    sequence(:name) { |n| "Channel #{n}" }
    current_topic 'Some random topic'
  end
end
