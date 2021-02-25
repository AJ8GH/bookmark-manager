describe Bookmark do
  describe '.all' do
    it 'returns all the bookmarks' do
      described_class.create(title: 'Makers', url: 'http://www.makersacademy.com')
      described_class.create(title: 'Google', url: 'http://www.google.com')
      described_class.create(title: 'Destroy', url: 'http://www.destroyallsoftware.com')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to be 3
      expect(bookmarks.map(&:title)).to include 'Google'
      expect(bookmarks.first.title).to eq 'Makers'
    end
  end

  describe '.create' do
    it 'adds a bookmark to the database' do
      bookmark = described_class.create(title: 'Test', url: 'http://test.com/')
      expect(described_class.all.map(&:title)).to include('Test')
      expect(described_class.all.map(&:url)).to include('http://test.com/')
    end

    it 'creates a new bookmark' do
      bookmark = described_class.create(title: 'Test', url: 'http://test.com')
      expect(bookmark.title).to eq 'Test'
      expect(bookmark.url).to eq 'http://test.com'
    end

    it 'does not create bookmark if url is invalid' do
      described_class.create(title: 'Test', url: 'Invalid')
      expect(described_class.all).to be_empty
    end
  end

  describe '.delete' do
    it 'deletes bookmark from database' do
      described_class.create(title: 'Test', url: 'http://test.com')
      expect(described_class.all).not_to be_empty

      described_class.delete(id: 1)
      expect(described_class.all).to be_empty
    end
  end

  describe '.find' do
    it 'finds bookmark by id' do
      described_class.create(title: 'Test', url: 'http://test.com')
      bookmark = described_class.find(id: 1)
      expect(bookmark.title).to eq 'Test'
    end

    it 'finds the correct bookmark by id' do
      described_class.create(title: 'Test', url: 'http://test.com')
      described_class.create(title: 'Other', url: 'http://test.com')
      described_class.create(title: 'Ruby', url: 'http://test.com')

      bookmark = described_class.find(id: 2)
      expect(bookmark.title).to eq 'Other'
    end
  end

  describe '.udpate' do
    it 'updates the record in the database' do
      bookmark = described_class.create(title: 'Test', url: 'http://test.com')
      described_class.update(id: bookmark.id, title: 'New title', url: bookmark.url)
      bookmark = described_class.find(id: bookmark.id)

      expect(bookmark.title).to eq 'New title'
      expect(bookmark.id).to eq bookmark.id
    end
  end

  describe '#title' do
    it 'returns the bookmarks title' do
      bookmark = described_class.create(title: 'Test', url: 'http://test.com/')
      expect(bookmark.title).to eq 'Test'
    end
  end

  describe '#url' do
    it 'returns the url' do
      bookmark = described_class.create(title: 'Test', url: 'http://test.com/')
      expect(bookmark.url).to eq 'http://test.com/'
    end
  end

  describe '#comments' do
    it 'returns the comments for that bookmark' do
      bookmark = described_class.create(title: 'Test', url: 'http://test.com')
      DatabaseConnection.query(
        "INSERT INTO comments(text, bookmark_id)
        VALUES('test comment', '#{bookmark.id}')
      ")
      comment = bookmark.comments.first
      expect(comment.text).to eq 'test comment'
    end
  end
end
