require 'pg'

p 'Setting up test database...'

def setup_test_database
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query(
    'TRUNCATE TABLE bookmarks, comments, tags, bookmark_tags
    RESTART IDENTITY;'
  )
end
