class BookmarkService

  def self.create(attributes:)
    site = get_site(attributes[:url])
    bookmark = site.bookmarks.new(attributes)
    bookmark.save if bookmark.valid?

    bookmark
  end

  def self.update(bookmark:, attributes:)
    bookmark.assign_attributes(attributes)
    bookmark.site = get_site(attributes[:url])
    bookmark.save
  end

  def self.top_level_url(url)
    uri = URI.parse(url)

    [uri.scheme, uri.host].join("://")
  end

  def self.get_site(url)
    Site.find_or_create_by(url: top_level_url(url))
  end

end
