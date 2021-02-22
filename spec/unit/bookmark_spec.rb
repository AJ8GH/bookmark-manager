describe Bookmark do
  describe '.all' do
    it 'returns all the bookmarks' do
      expect(described_class.all).to include 'https://fantasy.premierleague.com/'
      expect(described_class.all).to include 'https://www.amazon.co.uk/'
      expect(described_class.all).to include 'https://www.youtube.com/'
    end
  end
end
