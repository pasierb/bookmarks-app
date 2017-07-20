require 'test_helper'
require 'bookmark_service'

class BookmarkServiceTest < ActiveSupport::TestCase
  test "create should create site if don't exists" do
    assert_difference 'Site.count' do
      BookmarkService.create(attributes: {
        title: "Test",
        url: "https://github.com/pasierb"
      })
    end
  end

  test "create should find site if exists" do
    Site.create!(url: "https://github.com")

    assert_no_difference 'Site.count' do
      BookmarkService.create(attributes: {
        title: "Test",
        url: "https://github.com/pasierb"
      })
    end
  end

  test "update url should create ite don't exists" do
    bookmark = BookmarkService.create(attributes: {
      title: "Test",
      url: "https://github.com/pasierb"
    })

    assert_difference 'Site.count' do
      BookmarkService.update(bookmark: bookmark, attributes: {
        url: "https://pasierb.github.io/blog/"
      })
    end
  end

  test "update url should use existing site if exists" do
    bookmark = BookmarkService.create(attributes: {
      title: "Test",
      url: "https://github.com/pasierb"
    })

    assert_no_difference 'Site.count' do
      BookmarkService.update(bookmark: bookmark, attributes: {
        url: "https://github.com/trailblazer"
      })
    end
  end
end

