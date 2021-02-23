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
  end

  describe '#title' do
    it 'returns the bookmarks title' do
      bookmark = described_class.new(title: 'Test', url: 'http://test.com/')
      expect(bookmark.title).to eq 'Test'
    end
  end

  describe '#url' do
    it 'returns the url' do
      bookmark = described_class.new(title: 'Test', url: 'http://test.com/')
      expect(bookmark.url).to eq 'http://test.com/'
    end
  end
end
