require 'open_image_url'

class Bookmark < ApplicationRecord
  belongs_to :user
  after_create do
    bookmark = self
    bookmark.update(image: OpenImageUrl.get_url(self.url))
  end

  def self.search(search)
    if search
      where(['url LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
