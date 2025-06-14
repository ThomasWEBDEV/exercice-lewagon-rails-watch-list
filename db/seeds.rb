# db/seeds.rb
require "json"
require "open-uri"

puts "Cleaning database..."
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all
puts "Database cleaned!"

# Movies from TMDB (via Le Wagon proxy)
url = "https://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>" # L'API Key n'est pas nécessaire avec le proxy
movies_serialized = URI.open("https://tmdb.lewagon.com/movie/top_rated").read
movies = JSON.parse(movies_serialized)

movies["results"].each do |movie_hash|
  puts "Creating movie: #{movie_hash['title']}"
  Movie.create!(
    title: movie_hash["title"],
    overview: movie_hash["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie_hash['poster_path']}",
    rating: movie_hash["vote_average"]
  )
end

puts "Finished seeding!"
