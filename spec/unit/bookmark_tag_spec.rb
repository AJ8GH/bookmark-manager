describe BookmarkTag do
  describe '.create' do
    it 'creates a new bookmark tag' do
      bookmark = Bookmark.create(title: 'Test', url: 'http://test.com')
      tag = Tag.create(content: 'Test tag')
      bookmark_tag = described_class.create(tag_id: tag.id, bookmark_id: bookmark.id)

      expect(bookmark_tag.tag_id).to eq tag.id
      expect(bookmark_tag.bookmark_id).to eq bookmark.id
    end
  end
end
