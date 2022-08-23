# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'


puts 'Cleaning profiles db'
Profile.destroy_all

user = User.create!(
  email: 'test@campanazzo.com',
  password: 'password'
)
puts "Created test user #{user.email}"

puts '10 Creating professionals'
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password'
  )
    profile = Profile.create!(
      name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birthday: Faker::Date.between(from: '1970-09-23', to: '2006-09-25'),
      type_profile: 'Professional',
      type_professional: ['limpieza', 'Limpieza profunda', 'pintura', 'plomeria', 'Cuidado de jardin', 'Fila de espera', 'Lavado de vitrinas','Cuidado de Animales', 'Montaje', 'Montaje de muebles', 'Reparación Domestica'].sample,
      country: 'Colombia',
      city: 'Bogota',
      address:['Usaquén',
        'Chapinero',
        'Santa Fe',
        'San Cristóbal',
        'Usme',
        'Tunjuelito',
        'Bosa',
        'Kennedy',
        'Fontibón',
        'Engativá',
        'Suba',
        'Barrios Unidos',
        'Teusaquillo',
        'Los Mártires',
        'Antonio Nariño',
        'Puente Aranda',
        'Candelaria',
        'Rafael Uribe Uribe',
        'Ciudad Bolívar',
        'Sumapaz'].sample,
      personal_number: Faker::IDNumber.brazilian_citizen_number(formatted: true),
      score: rand(1..5),
      number_jobs: rand(10..222),
      user_id: user.id
    )

  puts "#{profile.name} #{profile.last_name} with #{user.email} created"
end
