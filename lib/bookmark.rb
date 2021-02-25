class Bookmark
  attr_reader :title, :url, :id

  class << self
    def all
      result = database.query('SELECT * FROM bookmarks;')
      result.map do |row|
        new(title: row['title'], url: row['url'], id: row['id'])
      end
    end

    def create(title:, url:)
      result = database.query(
        "INSERT INTO bookmarks (title, url)
        VALUES('#{title}', '#{url}')
        RETURNING id").first
      new(id: result['id'], url: url, title: title)
    end

    def delete(id:)
      database.query("DELETE FROM bookmarks WHERE id =#{id};")
      # database_connection.exec("ALTER SEQUENCE bookmarks_id_seq RESTART WITH 1;")
    end

    def find(id:)
      result = database.query(
        "SELECT * FROM bookmarks WHERE id = #{id}"
      ).first
      new(id: id, title: result['title'], url: result['url'])
    end

    def update(id:, title:, url:)
      database.query(
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

  def self.database
    DatabaseConnection
  end
end
