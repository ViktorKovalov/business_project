# Создание "отелей"
10.times do
  resort = Resort.create!(
    title: Faker::Company.name,
    location: Faker::Address.city,
    description: Faker::Lorem.paragraph
  )

  # Создание "комнат" для отеля
  3.times do
    RestingPlace.create!(
      resort: resort,
      room_number: Faker::Code.ean,
      room_description: Faker::Lorem.paragraph,
      bed_count: rand(1..10),
      price_per_night: rand(100..1000)
    )
  end
end
