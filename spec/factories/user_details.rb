FactoryBot.define do
  factory :user_detail do
    birthday { 10.days.ago }
    phone_number { Faker::PhoneNumber.cell_phone }

    # association :user, factory::user
    user
  end
end
