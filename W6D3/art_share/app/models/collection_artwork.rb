class CollectionArtwork < ApplicationRecord
  belongs_to :collection,
    foreign_key: :collection_id,
    class_name: :Collection 

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
end
