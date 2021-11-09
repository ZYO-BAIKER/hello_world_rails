FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    sequence(:account) {|n| "#{n}_#{Faker::Internet.username}"}
    sequence(:email) {|n| "#{n}_#{Faker::Internet.username}"}

    trait:with_user_detail do
      user_detail
    end
  end
end
