# db/seeds.rb
require "json"
require "open-uri"

puts "Cleaning database..."
Bookmark.destroy_all
List.destroy_all
Manga.destroy_all # MODIFIÉ : Movie.destroy_all est devenu Manga.destroy_all
puts "Database cleaned!"

# Nouvelle liste de noms de mangas pour les Mangas
manga_data = [
  { title: "Berserk", overview: "Guts, un épéiste solitaire maudit, affronte des démons dans un monde sombre.", poster_url: "https://via.placeholder.com/200x300.png?text=Berserk", rating: 9.5 },
  { title: "Devilman Crybaby", overview: "Un jeune homme timide fusionne avec un démon pour combattre ses pairs.", poster_url: "https://via.placeholder.com/200x300.png?text=Devilman", rating: 8.8 },
  { title: "Oyasumi Punpun", overview: "La vie difficile et les réflexions existentielles d'un jeune garçon représenté comme un oiseau.", poster_url: "https://via.placeholder.com/200x300.png?text=Punpun", rating: 9.3 },
  { title: "Blame!", overview: "Dans un futur dystopique, Killy cherche le Gène de la Densité du Réseau au milieu de structures tentaculaires.", poster_url: "https://via.placeholder.com/200x300.png?text=Blame", rating: 8.5 },
  { title: "Erased (Boku dake ga Inai Machi)", overview: "Un jeune homme voyage dans le temps pour empêcher un meurtre et sauver des vies innocentes.", poster_url: "https://via.placeholder.com/200x300.png?text=Erased", rating: 8.7 },
  { title: "Made in Abyss", overview: "Des enfants explorent un abysse gigantesque rempli de créatures étranges et de dangers mortels.", poster_url: "https://via.placeholder.com/200x300.png?text=MadeInAbyss", rating: 8.9 },
  { title: "Texhnolyze", overview: "Un monde souterrain régi par la technologie et la violence, où les humains sont augmentés par des prothèses.", poster_url: "https://via.placeholder.com/200x300.png?text=Texhnolyze", rating: 8.0 },
  { title: "Yotsuba&!", overview: "Les aventures quotidiennes d'une petite fille énergique et curieuse découvrant le monde.", poster_url: "https://via.placeholder.com/200x300.png?text=Yotsuba", rating: 9.0 },
  { title: "K-On!", overview: "Quatre lycéennes rejoignent le club de musique légère et apprennent à jouer de leurs instruments.", poster_url: "https://via.placeholder.com/200x300.png?text=K-On", rating: 7.9 },
  { title: "Flying Witch", overview: "Une jeune sorcière déménage à la campagne pour s'entraîner et s'adapte à sa nouvelle vie tranquille.", poster_url: "https://via.placeholder.com/200x300.png?text=FlyingWitch", rating: 8.2 },
  { title: "Aria", overview: "Une apprentie gondolière navigue dans les canaux d'une ville martienne ressemblant à Venise.", poster_url: "https://via.placeholder.com/200x300.png?text=Aria", rating: 8.6 },
  { title: "Shirokuma Cafe", overview: "Un panda et un ours polaire gèrent un café fréquenté par des animaux parlants et des humains.", poster_url: "https://via.placeholder.com/200x300.png?text=ShirokumaCafe", rating: 7.7 },
  { title: "March Comes in Like a Lion (Sangatsu no Lion)", overview: "L'histoire d'un joueur de shogi professionnel et de son cheminement émotionnel.", poster_url: "https://via.placeholder.com/200x300.png?text=MarchLion", rating: 8.5 },
  { title: "My Girl", overview: "Un homme célibataire élève la fille de son amour de jeunesse décédé, apprenant à être père.", poster_url: "https://via.placeholder.com/200x300.png?text=MyGirl", rating: 8.1 }
]

manga_data.each do |data|
  puts "Creating Manga: #{data[:title]}"
  Manga.create!(data)
end

puts "Finished seeding!"
