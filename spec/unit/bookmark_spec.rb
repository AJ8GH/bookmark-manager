describe Bookmark do
  before do
    allow(Bookmark).to receive(:all) do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      result = connection.exec('SELECT * FROM bookmarks;')
      result.map { |row| row['url'] }
    end
  end

  describe '.all' do
    it 'returns all the bookmarks' do
      expect(described_class.all).to include 'http://www.makersacademy.com'
      expect(described_class.all).to include 'http://www.google.com'
      expect(described_class.all).to include 'http://www.destroyallsoftware.com'
    end
  end
end
