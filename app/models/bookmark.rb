require 'open_image_url'

class Bookmark < ApplicationRecord
  validates :url, presence: true, url: true
  belongs_to :user
  after_create do
    bookmark = self
    bookmark.update(image: OpenImageUrl.get_url(url))
  end

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
