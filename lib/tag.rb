class Tag
  attr_reader :id, :content

  class << self
    def create(content:)
      result = DatabaseConnection.query(
        "INSERT INTO tags (content)
        VALUES ('#{content}') RETURNING id;"
      ).first
      new(id: result['id'], content: content)
    end

    def all
      result = DatabaseConnection.query('SELECT * FROM tags')
      result.map { |row| new(id: row['id'], content: row['content'])}
    end

    def find(id:)
      result = DatabaseConnection.query(
        "SELECT * FROM tags WHERE id = #{id}"
      ).first
      new(id: id, content: result['content'])
    end
  end

  def initialize(id:, content:)
    @id = id
    @content = content
  end
end
