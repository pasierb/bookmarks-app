class Site < ApplicationRecord
  has_many :bookmarks

  validates :url,
    presence: true,
    uniqueness: true,
    format: { with: URI::regexp(%w(http https)) }
end
