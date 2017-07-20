# Bookmarks app

## Description

Each bookmark has a title, an url and a shortening. All 3 are provided by the user. Title and
url are both required. Each bookmark belongs to a site. Site has a top level URL and it is
created together with the bookmark if it’s not already there.

For example if someone adds two bookmarks with urls: „http://reddit.com/cats” and
„http://reddit.com/dogs” and there is no site with URL „http://reddit.com” it will be created
when the first bookmark is added.

The application should allow user to create, edit, list and search bookmarks.

Bonus points:
  - add tags: each bookmark can have many tags
  - make search feature that allows users to search bookmarks by any field or tag

## Tests

```
$ bundle exec rails test
```
