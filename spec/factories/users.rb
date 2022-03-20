FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    # 追加があれば随時記載
  end
end
