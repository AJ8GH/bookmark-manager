require 'pg'

class Bookmark
  attr_reader :title, :url, :id

  class << self
    def all
      result = database_connection.exec('SELECT * FROM bookmarks;')
      result.map { |row| new(title: row['title'], url: row['url'], id: row['id']) }
    end

    def create(title:, url:)
      result = database_connection.exec(
        "INSERT INTO bookmarks (title, url)
        VALUES('#{title}', '#{url}')
        RETURNING id").first
      new(id: result['id'], url: url, title: title)
    end

    def delete(id:)
      database_connection.exec("DELETE FROM bookmarks WHERE id = #{id} ")
    end

    def find(id:)
      result = database_connection.query(
        "SELECT * FROM bookmarks WHERE id = #{id}"
      ).first
      new(id: id, title: result['title'], url: result['url'])
    end

    def update(id:, title:, url:)
      database_connection.exec(
        "UPDATE bookmarks
        SET title = '#{title}',
        url = '#{url}'
        WHERE id = #{id}")
    end
  end

  def initialize(title:, url:, id:)
    @title = title
    @url = url
    @id = id
  end

  private

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end
end
