FactoryBot.define do
  factory :book do
    association :user
    name { Faker::Book.title }
    image { 'https://robohash.org/beataeprovidentvoluptates.png?size=300x300&set=set1' }
    price { Faker::Number.number(digits: 5) }
    purchase_date { Faker::Date.between_except(from: '2020-01-01', to: '2020-09-25', excepted: Date.today) }
  end
end
