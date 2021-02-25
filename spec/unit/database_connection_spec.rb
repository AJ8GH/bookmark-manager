describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a persistant connection to the database' do
      db_connection = described_class.setup('bookmark_manager_test')
      expect(described_class.connection).to be db_connection
      expect(described_class.connection).not_to be_nil
    end

    it 'sends connect call to PG with correct database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      described_class.setup('bookmark_manager_test')
    end
  end

  describe '.query' do
    it 'runs a query on the setup connection' do
      connection = described_class.setup('bookmark_manager_test')

      expect(connection).to receive(:exec).with('SELECT * FROM bookmarks')

      described_class.query('SELECT * FROM bookmarks')
    end
  end
end
