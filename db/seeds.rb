# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'w@w.w', password: '111111')

5.times do
  ad = Ad.new
  ad.title = Faker::Lorem.sentence(word_count: rand(2..6))
  ad.content = Faker::Lorem.paragraph(sentence_count: rand(8..30))
  ad.user = User.first
  if rand(2) == 0
    filename = "rand#{rand(1..4)}.jpeg"
    ad.background = Rails.root.join('app', 'assets', 'images', filename).open
  end
  ad.save ? puts('Ad created') : puts('Error')
end