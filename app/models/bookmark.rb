class Bookmark < ApplicationRecord
  def self.search(search)
    if search
      where(['url LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
