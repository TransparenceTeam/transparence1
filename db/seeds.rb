#require "time"
#require 'faker'

#puts "cleaning up Db"

#Politician.destroy_all
#Tweet.destroy_all
#User.destroy_all
#Post.destroy_all

puts "Db is clean"

political_party1 = PoliticalParty.create!(
  name: 'Les Républicains',
  ref: 'LR',
  sum_members: 120,
  avatar: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/LesR%C3%A9publicains15logo.svg/1920px-LesR%C3%A9publicains15logo.svg.png',
  website_url: 'https://republicains.fr/',
  political_group_id: 4
)
puts "political party #{political_party1.id} has been created"

political_party2 = PoliticalParty.create!(
  name: 'La République En Marche',
  ref: 'LREM',
  sum_members: 120,
  avatar: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Logo-LREM-noir.svg/2880px-Logo-LREM-noir.svg.png',
  website_url: 'https://en-marche.fr/',
  political_group_id: 1
)
puts "political party #{political_party2.id} has been created"

political_party3 = PoliticalParty.create!(
  name: 'La France Insoumise',
  ref: 'LFI',
  sum_members: 2100,
  avatar: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Logo-LREM-noir.svg/2880px-Logo-LREM-noir.svg.png',
  website_url: 'https://lafranceinsoumise.fr/',
  political_group_id: 3
)
puts "political party #{political_party3.id} has been created"


politician1 = Politician.create!(
  name: 'Jean-Luc Mélenchon',
  role: 'President of the LFI Group at the National Assembly, Member for the 4th constituency of Bouches-du-Rhône',
  twitter_username: 'JLMelenchon',
  bio: "Jean-Luc Antoine Pierre Mélenchon, born 19 August 1951 is a French politician serving as the member of the National Assembly for the 4th constituency of Bouches-du-Rhône since 2017.",
  linkedin_url: 'https://www.linkedin.com/in/jlmelenchon/',
  wikipedia_url: "https://en.wikipedia.org/wiki/Jean-Luc_M%C3%A9lenchon",
  political_party_id: 3
)
puts "politician #{politician1.id} has been created"


politician2 = Politician.create!(
  name: 'Emmanuel Macron',
  role: 'President of the French Republic',
  twitter_username: 'EmmanuelMacron',
  bio: "Emmanuel Jean-Michel Frédéric Macron, born 21 December 1977 is a French politician who has been serving as the president of France and ex officio co-prince of Andorra since 14 May 2017.",
  linkedin_url: 'https://www.linkedin.com/in/emmanuelmacron/',
  wikipedia_url: "https://en.wikipedia.org/wiki/Emmanuel_Macron",
  political_party_id: 1
)
puts "politician #{politician2.id} has been created"


politician3 = Politician.create!(
  name: 'Nicolas Sarkozy',
  role: 'AccorHotels Independent Director and Chairman of the International Strategy Committee of the Board',
  twitter_username: 'NicolasSarkozy',
  bio: "Nicolas Paul Stéphane Sarközy de Nagy-Bocsa (/sɑːrˈkoʊzi/; French: [nikɔla pɔl stefan saʁkɔzi də naʒi bɔksa] (About this soundlisten); born 28 January 1955) is a retired French politician who served as President of France and ex officio Co-Prince of Andorra from 16 May 2007 until 15 May 2012.",
  linkedin_url: 'https://www.linkedin.com/in/nicolassarkozy/',
  wikipedia_url: "https://en.wikipedia.org/wiki/Nicolas_Sarkozy",
  political_party_id: 3
)
puts "politician #{politician3.id} has been created"


tweet1 = Tweet.create!(
  username: 'Emmanuel Macron',
  ref: '1362829183626465282',
  content: "Avec les dirigeants du G7, nos priorités pour 2021 sont claires : tout faire pour vaincre le virus, s'assurer d'une distribution équitable et efficace du vaccin, être solidaires avec les pays les plus vulnérables, relancer nos économies et accélérer la transition écologique.",
  date: '19 févr. 2021',
  politician_id: 2
)
puts "tweet #{tweet1.id} has been created"


tweet2 = Tweet.create!(
  username: 'Jean-Luc Mélenchon',
  ref: '1362496524463337488',
  content: 'Nous les Français, nous savons faire des fusées, des satellites, nous savons tout faire. Alors comment se fait-il qu’il y a 8 expéditions sur Mars et que les Français soient seulement spectateurs ? #Le20HdeLCI #Perseverance #CountdownToMars',
  date: '18 févr. 2021',
  politician_id: 1
)
puts "tweet #{tweet2.id} has been created"



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

policy_area1 = PolicyArea.create!(
  category: "Economics",
  subcategory: "Industry"
)

policy_area2 = PolicyArea.create!(
  category: "Politics",
  subcategory: "Government"
)

policy_area3 = PolicyArea.create!(
  category: "Society",
  subcategory: "Social"
)

policy_area4 = PolicyArea.create!(
  category: "Environment",
  subcategory: "Energy"
)

policy_area5 = PolicyArea.create!(
  category: "International",
  subcategory: "Europe"
)

3.times do
  post = Post.create!(
    tweet_id: rand(1..2),
    user_id: rand(1..4)
  )
  puts "Post #{post.id} is created"
end

2.times do
  matche = Match.create!(
    post_id: rand(1..2),
    project_law_id: rand(1..40),
    policy_area_id: rand(1..3)
  )
  puts "match #{matche.id} has been created"
end
