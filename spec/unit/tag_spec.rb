describe Tag do
  describe '.create' do
    it 'creates a new tag' do
      tag = described_class.create(content: 'Test tag')
      expect(tag.content).to eq 'Test tag'
    end
  end

  describe '.all' do
    it 'returns all the tags' do
      described_class.create(content: 'Test tag 1')
      described_class.create(content: 'Test tag 2')
      described_class.create(content: 'Test tag 3')

      tags = Tag.all.map(&:content)

      expect(tags).to include 'Test tag 1'
      expect(tags).to include 'Test tag 2'
      expect(tags).to include 'Test tag 3'
    end
  end

  describe '.find' do
    it 'returns tag by id' do
      tag1 = described_class.create(content: 'Test tag 1')
      tag2 = described_class.create(content: 'Test tag 2')

      found_tag1 = described_class.find(id: tag1.id)
      found_tag2 = described_class.find(id: tag2.id)

      expect(found_tag1.id).to eq tag1.id
      expect(found_tag2.id).to eq tag2.id

      expect(found_tag1.content).to eq tag1.content
      expect(found_tag2.content).to eq tag2.content
    end
  end
end
