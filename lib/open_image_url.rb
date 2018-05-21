require 'link_thumbnailer'
require 'open_image_url'

module OpenImageUrl
  def self.get_url(url)
    object = LinkThumbnailer.generate(url)
    imageurl = object.images.first.src.to_s
    return imageurl
  end
end
