class BookmarkTag
  attr_reader :id, :bookmark_id, :tag_id

  def self.create(tag_id:, bookmark_id:)
    result = DatabaseConnection.query(
      "INSERT INTO bookmark_tags (bookmark_id, tag_id)
      VALUES (#{bookmark_id}, #{tag_id}) RETURNING id;"
    ).first
    new(id: result['id'], bookmark_id: bookmark_id, tag_id: tag_id)
  end

  def initialize(id:, bookmark_id:, tag_id:)
    @id = id
    @bookmark_id = bookmark_id
    @tag_id = tag_id
  end
end
