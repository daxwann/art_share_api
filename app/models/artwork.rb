class Artwork < ApplicationRecord
  validates :artist_id, :image_url, presence: true
  validates :title, presence: true, uniqueness: { scope: :artist_id }
  validates :image_url, uniqueness: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :likes, as: :likeable

  def self.artworks_for_user_id(user_id)
    Artwork
      .left_outer_joins(:artwork_shares)
      .where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
      .distinct
  end
end
