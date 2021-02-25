describe Tag do
  describe '.create' do
    it 'creates a new tag' do
      tag = described_class.create(content: 'Test tag')
      expect(tag.content).to eq 'Test tag'
    end
  end
end
