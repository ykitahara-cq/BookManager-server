20.times do |n|
  @user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    token: SecureRandom.uuid
  )

  Book.create!(
    user_id: @user.id,
    name: Faker::Book.title,
    image: Faker::Avatar.image,
    price: Faker::Number.number(digits: 5),
    purchase_date: Faker::Date.between_except(from: '2020-01-01', to: '2020-09-25', excepted: Date.today)
  )
end
