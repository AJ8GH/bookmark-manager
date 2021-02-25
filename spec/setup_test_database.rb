require 'pg'

p 'Setting up test database...'

def setup_test_database
  DatabaseConnection.query(
    'TRUNCATE TABLE bookmarks, comments RESTART IDENTITY;'
  )
end
