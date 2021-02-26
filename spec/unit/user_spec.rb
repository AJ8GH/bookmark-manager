describe User do
  describe '.create' do
    it 'creates a new user' do
      user = described_class.create(email: 'test@test.com', password: 'Password123')
      expect(user.email).to eq 'test@test.com'
    end

    it 'passes the password through BCrypt before storing it' do
      expect(BCrypt::Password).to receive(:create).with 'Password123'
      described_class.create(email: 'test@test.com', password: 'Password123')
    end
  end

  describe '.find' do
    it 'returns user by their id' do
      user = User.create(email: 'testing@test.com', password: 'Password123')
      found_user = User.find(user_id: user.id)
      expect(found_user.email).to eq user.email
      expect(found_user.password).to eq user.password
      expect(found_user.id).to eq user.id
    end
  end
end
