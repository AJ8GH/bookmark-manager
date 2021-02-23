require 'pg'

class Bookmark
  attr_reader :title, :url

  class << self
    def all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bookmark_manager_test')
      else
        connection = PG.connect(dbname: 'bookmark_manager')
      end
      result = connection.exec('SELECT * FROM bookmarks;')
      result.map { |row| new(title: row['title'], url: row['url']) }
    end

    def create(bookmark)
      title, url = bookmark[:title], bookmark[:url]

      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bookmark_manager_test')
      else
        connection = PG.connect(dbname: 'bookmark_manager')
      end
      result = connection.exec(
        "INSERT INTO bookmarks (title, url)
        VALUES('#{title}', '#{url}')
        RETURNING id, url, title;")
      new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
    end
  end

  def initialize(args)
    @title = args[:title]
    @url = args[:url]
  end
end
