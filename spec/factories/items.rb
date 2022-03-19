FactoryBot.define do
  factory :item do
    title { Faker::Name.name }
    explanation { Faker::Name.name }
    genre_id { Faker::Number.between(from: 1, to: 4) }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/icon.png'), filename: 'icon.png')
    end
  end
end

# bundle exec rspec spec/models/item_spec.rb