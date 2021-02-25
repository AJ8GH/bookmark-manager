describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      bookmark = Bookmark.create(title: 'Test', url: 'http://test.com')
      comment = described_class.create(text: 'Test comment', bookmark_id: bookmark.id)

      expect(comment.text).to eq 'Test comment'
    end
  end

  describe '.where' do
    it 'finds all comments for specific bookmark' do
      bookmark = Bookmark.create(title: 'Test', url: 'http://test.com')
      comment = described_class.create(text: 'great bookmark', bookmark_id: bookmark.id)

      comments = described_class.where(bookmark_id: bookmark.id)

      expect(comments.first.text).to eq comment.text
      expect(comments.first.id).to eq comment.id
      expect(comments.first.bookmark_id).to eq comment.bookmark_id
    end
  end
end
