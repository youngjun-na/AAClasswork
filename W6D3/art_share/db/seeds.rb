# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

paul = User.create(username: 'paulrose')
yj = User.create(username: 'yjna')
miles = User.create(username: 'smiles')
max = User.create(username: 'beardman420')

mona = Artwork.create(title: 'Mona Lisa', image_url: 'mona_lisa.jpg', artist_id: 1)
lisa = Artwork.create(title: 'Lisa Mona', image_url: 'lisa_mona.png', artist_id: 1)
picasso = Artwork.create(title: 'Guernica', image_url: 'pew_pew.jpg', artist_id: 2)
pollock = Artwork.create(title: 'Untitled', image_url: 'splotches.gif', artist_id: 3)

share1 = ArtworkShare.create(artwork_id: 1,viewer_id: 1)
share2 = ArtworkShare.create(artwork_id: 1,viewer_id: 2)
share3 = ArtworkShare.create(artwork_id: 1,viewer_id: 3)
share4 = ArtworkShare.create(artwork_id: 1,viewer_id: 4)
share5 = ArtworkShare.create(artwork_id: 2,viewer_id: 3)
share6 = ArtworkShare.create(artwork_id: 3,viewer_id: 2)
share7 = ArtworkShare.create(artwork_id: 3,viewer_id: 1)
share8 = ArtworkShare.create(artwork_id: 4,viewer_id: 1)
share9 = ArtworkShare.create(artwork_id: 4,viewer_id: 4)
