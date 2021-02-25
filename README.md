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

- First, connect to psql

### Development Environment:

  - Create `bookmark_manager` database:
  ```sql
  CREATE DATABASE bookmark_manager;
  ```
  - Create `bookmarks` table
  ```sql
  CREATE TABLE bookmarks(
    id SERIAL PRIMARY KEY,
    url VARCHAR(60)
  );
  ```
  - Add `title` column to bookmarks table
  ```sql
  ALTER TABLE Bookmarks
  ADD COLUMN title varchar(60);

  ```
  - Create `comments` table
  ```sql
  CREATE TABLE comments(
    id SERIAL PRIMARY KEY,
    text VARCHAR(240),
    bookmark_id INTEGER REFERENCES bookmarks (id)
  );
```

### Test Environment

  - Create `bookmark_manager_test` database:
  ```sql
  CREATE DATABASE bookmark_manager;
  ```
  - Create identical `bookmarks` table as above
  - Create id

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

As a website user,
So that I can revisit pages I enjoy,
I want to be able to add bookmarks

### Delete bookmarks

As a website user,
So that I can remove bookmarks I no longer need,
I want to be able to delete bookmarks

### Update bookmarks

As a user,
So that I can fix typos and out of date bookmarks,
I want to be able to update bookmarks

### Comment on bookmarks

As a user,
So that I can share opinions on bookmarks,
I want to be able to comment on bookmarks

### Tag bookmarks into categories

As a user,
So that I can easily see which category a bookmark is,
I want to be able to add tags to bookmkarks

### Filter bookmarks by tag

As a user,
So that I can see bookmarks of a specific category,
I want to be able to filter bookmarks by their tags

### Users are restricted to manage only their own bookmarks

As a user,
So that other users can't delete or edit my bookmarks,
I want to have my bookmarks secured with a password
