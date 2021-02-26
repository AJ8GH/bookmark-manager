describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@test.com', password: 'Password123')
      expect(user.email).to eq 'test@test.com'
      expect(user.password).to eq 'Password123'
    end
  end
end
