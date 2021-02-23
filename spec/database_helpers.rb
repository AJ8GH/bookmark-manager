def test_connection
  PG.connect(dbname: 'bookmark_manager_test')
end

def truncate_table
  connection = test_connection
  connection.exec('TRUNCATE bookmarks;')
  connection.close
end

def insert_bookmarks
  connection = test_connection
  connection.exec(
    "INSERT INTO
      bookmarks(url)
    VALUES
      ('http://www.destroyallsoftware.com'),
      ('http://www.google.com'),
      ('http://www.makersacademy.com');"
  )
  connection.close
end

def database_set_up
  truncate_table
  insert_bookmarks
  connection = test_connection
  allow(PG).to receive(:connect) { connection }
end
