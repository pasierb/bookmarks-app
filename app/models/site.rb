class Site < ApplicationRecord
  has_many :bookmarks

  scope :url, -> (url) { where(url: url) }

  validates :url,
    presence: true,
    uniqueness: true,
    format: { with: URI::regexp(%w(http https)) }
end
