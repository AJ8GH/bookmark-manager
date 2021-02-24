describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to the database argument and saves it' do
      db_connection = described_class.setup(dbname: 'bookmark_manager_test')
      expect(described_class.connection).to be db_connection
      expect(described_class.connection).to respond_to(:query)
    end
  end

  describe '.query' do
    it 'executes query argument via' do
      Bookmark.create(title: 'Test', url: 'http://test.com')

      query = described_class.query('SELECT * FROM bookmarks')
      expect(query.first['title']).to eq 'Test'
      expect(query.first['url']).to eq 'http://test.com'
      expect(query.first['id']).to eq '1'
    end
  end
end
