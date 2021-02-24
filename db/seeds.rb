require 'faker'

if Rails.env.development?
  User.destroy_all
  Auction.destroy_all
end

puts 'Creating users...'

10.times do 
  new_user = User.new(
    first_name: "#{Faker::Name.first_name}",
    last_name: "#{Faker::Name.last_name}",
    email: "#{Faker::Internet.email}",
    encrypted_password: Faker::Internet.password,
  )
end

puts '10 new users created!'

puts 'Creating auctions...'

10.times do 
  new_user = Auction.new(
    name: "#{Faker::Superhero.name}",
    description: "#{Faker::TvShows::MichaelScott.quote}",
    category: ['Hot Toys', 'Mezco', 'Neca', 'Mafex', 'Iron Studios', 'Bandai'].sample,
    min_price: (10..800).sample,
    deadline: Faker::Date.between(from: '2014-09-23', to: '2014-09-25')
  )
end