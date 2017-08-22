# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  first_name: 'Carl',
  last_name: 'Quivron',
  email: 'carl.quivron@gmail.com',
  password: '123456',
  password_confirmation: '123456',
)
User.create!(
  first_name: 'Augustin',
  last_name: 'Poupard',
  email: 'augustin.poupard@gmail.com',
  password: '123456',
  password_confirmation: '123456',
)
User.create!(
  first_name: 'Geoffroy',
  last_name: 'Hauwen',
  email: 'hauwengeoffroy@gmail.com',
  password: '123456',
  password_confirmation: '123456',
)

puts 'Seed Completed'
