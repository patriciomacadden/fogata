FactoryGirl.define do
  factory :channel do
    sequence(:name) { |n| "Channel #{n}" }
    current_topic 'Some random topic'
    user
  end
  
  factory :user do
    sequence(:email) { |n| "user#{n}@gmail.com" }
    sequence(:first_name) { |n| "Name #{n}" }
    sequence(:last_name) { |n| "Last name #{n}" }
    provider 'google_oauth2'
    sequence(:uid) { |n| "user#{n}" }
  end
end
