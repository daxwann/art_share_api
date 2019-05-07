class Collection < ApplicationRecord
  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :collection_artworks,
    primary_key: :id,
    foreign_key: :collection_id,
    class_name: :CollectionArtwork,
    dependent: :destroy

  has_many :artworks,
    through: :collection_artworks,
    source: :artwork
end
