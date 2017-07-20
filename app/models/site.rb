class Site < ApplicationRecord
  validates :url,
    presence: true,
    uniqueness: true,
    format: { with: URI::regexp(%w(http https)) }
end
