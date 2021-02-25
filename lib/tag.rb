class Tag
  attr_reader :id, :content

  def self.create(content:)
    result = DatabaseConnection.query(
      "INSERT INTO tags (content)
      VALUES ('#{content}') RETURNING id;"
    ).first
    new(id: result['id'], content: content)
  end

  def initialize(id:, content:)
    @id = id
    @content = content
  end
end
