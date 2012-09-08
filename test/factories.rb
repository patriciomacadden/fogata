FactoryGirl.define do
  factory :channel do
    sequence(:name) { |n| "Channel #{n}" }
    current_topic 'Some random topic'
    user
  end
  
  factory :user do
    provider 'google_oauth2'
    sequence(:uid) { |n| "user#{n}" }
  end
end
