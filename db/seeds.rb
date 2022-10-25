# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# 1 Cleaning records but professions
puts 'Cleaning profiles db'
MyProfession.destroy_all
Reservation.delete_all
Post.destroy_all
Profile.destroy_all
User.destroy_all

# 2 Creation of profiles type worker.  Each profile requires a user to manage the authentication
# 2a creation user test for front-end testing
user = User.create!(
  email: 'test@campanazzo.com',
  password: 'password'
)
puts "Created test user #{user.email}"
puts '###############################################'

puts 'CREATING profile professionals'

# 2b Creation of 10 profiles type worker
professions_bucket = []
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
      type_professional: ['Elite','Bueno Bonito y Barato'].sample,
      country: 'Colombia',
      city: 'Bogota',
      address:['Calle 71 27 111221 Bogotá',
        'Carrera 7 52 110111 Bogotá',
        'Carrera 68 50 110831 Bogotá',
        'Calle 84 49 111211 Bogotá',
        'Calle 23G 17 110911 Bogotá',
        'Carrera 53C 39 110611 Bogotá',
        'Carrera 7 10 110111 Bogotá',
        'Calle 13 78 110821 Bogotá',
        'Carrera 27C 6 111211 Bogotá',
        'Carrera 23 63 110141 Bogotá',
        'Carrera 95A 65 110711 Bogotá',
        'Barrios Unidos',
        'Carrera 101B 129 111131 Bogotá',
        'Carrera 27A 32 111221 Bogotá',
        'Carrera 16A 7 110111 Bogotá',
        'Puente Aranda'].sample,
      personal_number: Faker::IDNumber.brazilian_citizen_number(formatted: true),
      score: 0,
      number_jobs: 0,
      user_id: user.id,
      vehicle: ['Camion ligero', 'Van', 'Camion grande', 'No'].sample
    )

    file = URI.open('https://www.thispersondoesnotexist.com/image')
    profile.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

    # 2b-1 Creation of record in table MyProfession for the profile-worker recently created
  my_profession = MyProfession.create!(
    profile_id: profile.id,
    profession_id: Profession.order("RANDOM()").first.id,
    year: ["2-5 años","5-10 años","10-20 años","+20 años"].sample,
    price_hour: [100000, 50000, 45000, 120000, 30000].sample,
    bio: ["Experto trabajador, responsable y puntual", "Feliz de ayudar", "Tengo la motivacion para hacerlo"].sample
  )
    # 2b-2 creation of array containing the MyProfessions IDs of the 10 profiles-worker created above.
  professions_bucket << my_profession.id
  puts "#{profile.name} - #{(Profession.find(my_profession.profession_id)).name} was created"
end

puts '###############################################'
puts "list of professions  created : #{professions_bucket}"

  # 3 Creation of 4 profiles type customers
puts 'CREATING profile customer'
4.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password'
  )
    profile = Profile.create!(
      name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birthday: Faker::Date.between(from: '1970-09-23', to: '2006-09-25'),
      type_profile: 'Customer',
      country: 'Colombia',
      city: 'Bogota',
      address:['Calle 71 27 111221 Bogotá',
        'Carrera 7 52 110111 Bogotá',
        'Carrera 68 50 110831 Bogotá',
        'Calle 84 49 111211 Bogotá',
        'Calle 23G 17 110911 Bogotá',
        'Carrera 53C 39 110611 Bogotá',
        'Carrera 7 10 110111 Bogotá',
        'Calle 13 78 110821 Bogotá',
        'Carrera 27C 6 111211 Bogotá',
        'Carrera 23 63 110141 Bogotá',
        'Carrera 95A 65 110711 Bogotá',
        'Barrios Unidos',
        'Carrera 101B 129 111131 Bogotá',
        'Carrera 27A 32 111221 Bogotá',
        'Carrera 16A 7 110111 Bogotá',
        'Puente Aranda'].sample,
      personal_number: Faker::IDNumber.brazilian_citizen_number(formatted: true),
      score: 0,
      number_jobs: 0,
      user_id: user.id
    )

  puts "#{profile.name} #{profile.last_name} with #{user.email} created"

  # 3a creation of post for the profile-customer that was recently created.
  #profession_wanted = Profession.order("RANDOM()").first

  profession_wanted = Profession.find((MyProfession.find(professions_bucket.sample)).profession_id)
  post = Post.create!(
    name: ["Ayuda con #{profession_wanted.name}", "Se necesita #{profession_wanted.name} ", "Servicio de #{profession_wanted.name}"].sample,
    description: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sit amet auctor lectus, fermentum eleifend tortor. Nullam ac orci nisi. Vestibulum convallis","Sed euismod ante nec sem placerat, ac eleifend ligula porta. Suspendisse interdum posuere est, eget tincidunt lacus porta vitae. Fusce sit amet eros eget risus mollis scelerisque vel vel nisi. Proin in ipsum vitae lacus aliquam faucibus eget id libero. Nunc auctor lorem eu finibus sodales","Sed at congue turpis, at suscipit eros. Vestibulum faucibus erat et elementum consequat. Integer sapien nisl, sagittis vel turpis vitae, varius eleifend tortor.","Aliquam vel malesuada massa, at sodales nunc. Sed dictum est metus, eget pretium nulla iaculis non. Pellentesque luctus porttitor tempor.","Aenean facilisis orci sit amet massa pulvinar sagittis. Mauris eget laoreet leo, eu commodo enim. Nulla varius est a justo bibendum egestas."].sample,
    address: ['Calle 71 27 111221 Bogotá',
      'Carrera 7 52 110111 Bogotá',
      'Carrera 68 50 110831 Bogotá',
      'Calle 84 49 111211 Bogotá',
      'Calle 23G 17 110911 Bogotá',
      'Carrera 53C 39 110611 Bogotá',
      'Carrera 7 10 110111 Bogotá',
      'Calle 13 78 110821 Bogotá',
      'Carrera 27C 6 111211 Bogotá',
      'Carrera 23 63 110141 Bogotá',
      'Carrera 95A 65 110711 Bogotá',
      'Barrios Unidos',
      'Carrera 101B 129 111131 Bogotá',
      'Carrera 27A 32 111221 Bogotá',
      'Carrera 16A 7 110111 Bogotá',
      'Puente Aranda'].sample,
    validated: true,
    quick_assessment: ["1 hora", "2 horas", "3 horas"].sample,
    profile_id: profile.id,
    profession_id:  profession_wanted.id,
  )
  puts "#{profile.name} has created the post : #{post.name} "

  # 4 Creating the reservation
  start_date = Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :morning)
  end_hour = post.quick_assessment[0].nil? ? 1 : post.quick_assessment[0].to_i
  end_date = start_date + end_hour.hour



  if !Profile.joins(:my_professions).where(my_professions:{profession_id: profession_wanted.id}).empty?
    reservation = Reservation.create!(
      post_id: post.id,
      profile_id: Profile.joins(:my_professions).where(my_professions:{profession_id: profession_wanted.id}).first.id ,
      start_date: start_date,
      end_date: end_date
    )
    puts "#{reservation.start_date} was created"
  end

end

puts '###############################################'
