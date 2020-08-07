FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { 'password123' }
    token { SecureRandom.uuid }

    trait :login do
      email { 'ruben_runte@schmitt.co' }
      password { 'password' }
      token { '3ce9ec7f-0ceb-4473-b9fe-c01b528e5b7d' }
    end
    trait :invalid_user do
      email { 'ruben_runteschmitt.co' }
      password { 'pass' }
      token { '3ce9ec7f-0ceb-4473-b9fe-c01b528e5b7d' }
    end
  end
end
