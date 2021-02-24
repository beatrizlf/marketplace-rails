require 'faker'

if Rails.env.development?
  Auction.destroy_all
  User.destroy_all
end

puts 'Creating users...'

10.times do 
  new_user = User.create(
    first_name: "#{Faker::Name.first_name}",
    last_name: "#{Faker::Name.last_name}",
    email: "#{Faker::Internet.email}",
    password: Faker::Internet.password
  )
end

puts '10 new users created!'

puts 'Creating auctions...'

10.times do 
  new_user = Auction.create(
    user_id: User.last.id,
    name: "#{Faker::Superhero.name}",
    description: "#{Faker::TvShows::MichaelScott.quote}",
    category: ['Hot Toys', 'Mezco', 'Neca', 'Mafex', 'Iron Studios', 'Bandai'].sample,
    min_price: (10..800).to_a.sample,
    deadline: Faker::Date.between(from: '2021-02-01', to: '2021-12-30')
  )
end

puts 'Auctions created!'