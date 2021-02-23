describe Bookmark do
  before { database_set_up }

  describe '.all' do
    it 'returns all the bookmarks' do
      expect(described_class.all).to include 'http://www.makersacademy.com'
      expect(described_class.all).to include 'http://www.google.com'
      expect(described_class.all).to include 'http://www.destroyallsoftware.com'
    end
  end
end
