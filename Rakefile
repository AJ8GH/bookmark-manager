task :test_database_setup do
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query(
    'TRUNCATE TABLE bookmarks, comments, tags, bookmark_tags
    RESTART IDENTITY;'
  )
end

task :create_databases do
  %w[bookmark_manager bookmark_manager_test].each do |database|
    connection = PG.connect

    connection.exec("CREATE DATABASE #{database};")

    connection = PG.connect(dbname: database)

    connection.exec(
      "CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR (60)); "
    )

    connection.exec(
      "ALTER TABLE bookmarks ADD COLUMN title VARCHAR (60);"
    )

    connection.exec(
      "CREATE TABLE comments(
        id SERIAL PRIMARY KEY,
        text VARCHAR (240),
        bookmark_id INTEGER REFERENCES bookmarks (id)
      );"
    )

    connection.exec(
      "ALTER TABLE comments
        DROP CONSTRAINT comments_bookmark_id_fkey,
        ADD CONSTRAINT comments_bookmark_id_fkey
          FOREIGN KEY (bookmark_id)
          REFERENCES bookmarks(id)
          ON DELETE CASCADE;"
    )

    connection.exec(
      "CREATE TABLE tags(
        id SERIAL PRIMARY KEY,
        content VARCHAR (60)
      );"
    )

    connection.exec(
      "CREATE TABLE bookmark_tags(
        id SERIAL PRIMARY KEY,
        bookmark_id INTEGER REFERENCES bookmarks (id),
        tag_id INTEGER REFERENCES tags (id)
      );"
    )
  end
end
