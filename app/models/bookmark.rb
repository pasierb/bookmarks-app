class Bookmark < ApplicationRecord
  belongs_to :site

  scope :search, -> query {
    return where(%Q(1 = 1)) unless query.present?

    where([%Q(
      title ILIKE :q OR
      url ILIKE :q OR
      short ILIKE :q OR
      tags @> :tag
    ), q: "%#{query}%", tag: "{#{query}}"])
  }

  validates :title, presence: true
  validates :url, presence: true, format: { with: URI::regexp(%w(http https)) }
  validates :site_id, presence: true

  def tagline=(tags_string)
    self.tags = tags_string.strip.split(/\W*,\W*/)
  end

  def tagline
    self.tags.join(", ")
  end

end
