require "time"
require 'faker'

puts "cleaning up Db"

puts "Db is clean"

10.times do
  politician = Politician.create!(
   first_name: ["Jean","Marc","Elisabeth","Sophie","Gabriel"].sample,
   last_name:["Castex","Fesneau","Moreno","Cluzel","Attal"].sample,
   twitter_username: ["funny name", 'cool name', 'bad name', 'crazyname'].sample,
   bio:
   [
    "Ancien maire d'Yerres et député de l'Essonne, il est président de Debout la France. Il s'est présenté aux élections présidentielles de 2012 et 2017, où il a obtenu respectivement 1,79 % et 4,70 % des voix, s'alliant à Marine Le Pen pour le second tour en 2017. Il annonce une troisième candidature le 26 septembre 20208,9.",
    "Souverainiste parfois qualifié de complotiste, il est le fondateur de l’Union populaire républicaine en 2007. Il échoue à se présenter à l'élection présidentielle de 2012, puis obtient 0,92 % des suffrages exprimés à celle de 2017. Il annonce sa candidature le 4 avril 20196. En février 2021, il est mis en examen notamment pour « harcèlement et agressions sexuelles »7.",
    "Député de la 20e circonscription du Nord depuis 2017, il devient secrétaire national du Parti communiste français en 2018. Il annonce sa candidature le 26 novembre 202018. Un vote interne au PCF le départagera de Jean-Luc Mélenchon en mai 2021 pour désigner le candidat du parti19."
    ].sample,

   role: ["president", "prime minister", "deputy"].sample,
   political_group_id: rand(1..12)
    )
  puts "Politician #{politician.id} is created"
end

10.times do
  tweet = Tweet.create!(
    username: ["Olga", "Victor", "Gaurav", "Baptiste"].sample,
    content: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr",
    hashtag: ["economy", "environment", "technology", "culture", "sport"].sample,
    date: Date.today,
    politician_id: rand(1..10)
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
    tweet_id: rand(1..10),
    user_id: rand(1..4)
    )
  puts "Post #{post.id} is created"
end
