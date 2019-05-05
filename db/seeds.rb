# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all
  
  User.create!(username: 'Marcel')
  User.create!(username: 'Jasper')
  User.create!(username: 'Leonardo')
  User.create!(username: 'Ruth')
  User.create!(username: 'Claude')

  Artwork.create!(title: "Urinal", image_url: "www.urinal.com", artist_id: 1)
  Artwork.create!(title: "Wheel", image_url: "www.marcel.com/wheel", artist_id: 1)
  Artwork.create!(title: "Target", image_url: "www.target.com", artist_id: 2)
  Artwork.create!(title: "American Flag", image_url: "www.jasper.com/flag", artist_id: 2)
  Artwork.create!(title: "Last Supper", image_url: "www.supper.com", artist_id: 3)
  Artwork.create!(title: "Mona Lisa", image_url: "www.davinci.com/monalisa", artist_id: 3)
  Artwork.create!(title: "Untitled", image_url: "www.ruth.com/untitled", artist_id: 4)
  Artwork.create!(title: "Sculpture", image_url: "www.ruth.com/sculpture", artist_id: 4)
  Artwork.create!(title: "Untitled", image_url: "www.claude.com/untitled", artist_id: 5)
  Artwork.create!(title: "Self-portrait", image_url: "www.claude.com/selfportrait", artist_id: 5)

  ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
  ArtworkShare.create!(artwork_id: 1, viewer_id: 4)
  ArtworkShare.create!(artwork_id: 2, viewer_id: 3)
  ArtworkShare.create!(artwork_id: 2, viewer_id: 5)
  ArtworkShare.create!(artwork_id: 3, viewer_id: 1)
  ArtworkShare.create!(artwork_id: 3, viewer_id: 4)
  ArtworkShare.create!(artwork_id: 4, viewer_id: 4)
  ArtworkShare.create!(artwork_id: 5, viewer_id: 2)
  ArtworkShare.create!(artwork_id: 6, viewer_id: 5)
  ArtworkShare.create!(artwork_id: 6, viewer_id: 1)
  ArtworkShare.create!(artwork_id: 7, viewer_id: 1)
  ArtworkShare.create!(artwork_id: 7, viewer_id: 3)
  ArtworkShare.create!(artwork_id: 8, viewer_id: 2)
  ArtworkShare.create!(artwork_id: 9, viewer_id: 3)
  ArtworkShare.create!(artwork_id: 9, viewer_id: 4)
  ArtworkShare.create!(artwork_id: 10, viewer_id: 4)
  ArtworkShare.create!(artwork_id: 10, viewer_id: 1)
end
