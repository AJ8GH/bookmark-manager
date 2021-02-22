# Bookmark Manager

## Dependencies

ruby version
- `2.7.2`

gems
- `capybara`
- `coveralls`
- `puma`
- `rack`
- `rspec`
- `rspec-sinatra`
- `rubocop`
- `sinatra`

## Getting started

## Setting up database

- Connect to psql
- Create `bookmark_manager` database:
```sql
CREATE DATABASE bookmark_manager;
```
- Create `bookmarks` table
```sql
CREATE TABLE bookmarks(
  id SERIAL PRIMARY KEY,
  url VARCHAR ( 60 )
);
```

## Running tests

## Specifications

- Show a list of bookmarks
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks

## User stories

### Show a list of bookmarks

```
As a user,
So that I can quickly visit my favourite sites,
I want to be able to see a list of bookmarks
```

![show-list-of-bookmarks](public/images/domain-models/see_list_of_bookmarks.png)

### Add new bookmarks

### Delete bookmarks

### Update bookmarks

### Comment on bookmarks

### Tag bookmarks into categories

### Filter bookmarks by tag

### Users are restricted to manage only their own bookmarks
