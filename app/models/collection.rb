class Collection < ApplicationRecord
  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :artworks,
    primary_key: :id,
    foreign_key: :collection_id,
    class_name: :CollectionArtwork
end
