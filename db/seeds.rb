# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies['results'].each do |movie|
  title = movie['title']
  overview = movie['overview']
  poster_path = movie['poster_path']
  new_movie = Movie.new(title: title, overview: overview, poster_url: poster_path)
  puts new_movie.valid?
  new_movie.save!
  puts Movie.last
end


puts 'done seeding'
