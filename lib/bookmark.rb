require 'uri'

class Bookmark
  attr_reader :title, :url, :id

  class << self
    def all
      result = DatabaseConnection.query('SELECT * FROM bookmarks;')
      result.map do |row|
        new(title: row['title'], url: row['url'], id: row['id'])
      end
    end

    def create(title:, url:)
      return false unless valid_url?(url)

      result = DatabaseConnection.query(
        "INSERT INTO bookmarks (title, url)
        VALUES('#{title}', '#{url}')
        RETURNING id;"
      ).first

      new(id: result['id'], url: url, title: title)
    end

    def delete(id:)
      DatabaseConnection.query("DELETE FROM bookmarks WHERE id =#{id};")
    end

    def find(id:)
      result = DatabaseConnection.query(
        "SELECT * FROM bookmarks WHERE id = #{id};"
      ).first
      new(id: id, title: result['title'], url: result['url'])
    end

    def update(id:, title:, url:)
      DatabaseConnection.query(
        "UPDATE bookmarks
        SET title = '#{title}',
        url = '#{url}'
        WHERE id = #{id};"
      )
    end
  end

  def initialize(title:, url:, id:)
    @title = title
    @url = url
    @id = id
  end

  def comments(comment_class = Comment)
    comment_class.where(bookmark_id: id)
  end

  private

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
