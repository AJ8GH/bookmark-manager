class Comment
  attr_reader :id, :text, :bookmark_id

  def self.create(text:, bookmark_id:)
    row = DatabaseConnection.query("
      INSERT INTO comments (text, bookmark_id)
      VALUES ('#{text}', '#{bookmark_id}') RETURNING id;"
    ).first
    new(id: row['id'], text: text, bookmark_id: bookmark_id)
  end

  def self.where(bookmark_id:)
    result = DatabaseConnection.query("
      SELECT * FROM comments WHERE bookmark_id = #{bookmark_id};"
    )
    result.map do |row|
      new(id: row['id'], text: row['text'], bookmark_id: row['bookmark_id'])
    end
  end

  def initialize(id:, text:, bookmark_id:)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end
end
