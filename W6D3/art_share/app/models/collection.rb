class Collection < ApplicationRecord
  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  has_many :collection_artworks,
    foreign_key: :collection_id,
    class_name: :CollectionArtwork

  has_many :artworks,
    through: :collection_artworks,
    source: :artwork
end
