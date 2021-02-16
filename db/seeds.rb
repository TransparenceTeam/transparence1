require "time"
require 'faker'

puts "cleaning up Db"

puts "Db is clean"

10.times do
  politician = Politician.create!(
   first_name: ["Jean","Marc","Elisabeth","Sophie","Gabriel"].sample,
   last_name:["Castex","Fesneau","Moreno","Cluzel","Attal"].sample,
   twitter_username: ["funny name", 'cool name', 'bad name', 'crazyname'].sample,
   bio: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet",
   role: ["president", "prime minister", "deputy"].sample
    )
  puts "Politician #{politician.id} is created"
end

10.times do
  tweet = Tweet.create!(
    username: ["Olga", "Victor", "Gaurav", "Baptiste"].sample,
    content: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr",
    hashtag: ["economy", "environment", "technology", "culture", "sport"].sample,
    date: Date.today,
    politician_id: rand(20..40)
    )
  puts "Tweet #{tweet.id} is created"
end

4.times do
  user = User.create!(
    email: Faker::Internet.email,
    first_name: ["olga", "baptiste", "victor", "gaurav"].sample,
    username: ["olga", "baptiste", "victor", "gaurav"].sample,
    last_name: ["gabbet", "klocker", "la fur", "lewagon"].sample,
    password: "123456",
    is_contributer: [true, false].sample
    )
  puts "User #{user.id} is created"
end

3.times do
  post = Post.create!(
    tag: ["economy", "Gaurav", "Baptiste"].sample,
    policy_area: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr",
    tweet_id: rand(70..80),
    user_id: rand(1..15)
    )
  puts "Post #{post.id} is created"
end
