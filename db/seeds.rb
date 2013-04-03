require 'faker'

10.times do 
  puts Faker::Internet.url()
  Url.create(url: Faker::Internet.url(), 
    short_url: Faker::Internet.url(), 
    click_counter: 3)
end