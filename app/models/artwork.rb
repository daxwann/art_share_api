class Artwork < ApplicationRecord
  validates :artist_id, :image_url, presence: true
  validates :title, presence: true, uniqueness: { scope: :artist_id }

end
