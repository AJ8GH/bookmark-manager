require 'bcrypt'

class User
  include BCrypt

  attr_reader :id, :email, :password

  class << self
    def create(email:, password:)
      result = DatabaseConnection.query(
        "INSERT INTO users (email, password)
        VALUES ('#{email}', '#{encrypt(password)}') RETURNING id, password;"
      ).first
      new(id: result['id'], email: email, password: result['password'])
    end

    def find(user_id:)
      row = DatabaseConnection.query("SELECT * FROM users WHERE id = #{user_id};").first
      new(id: user_id, email: row['email'], password: row['password'])
    end

    private

    def encrypt(password)
      BCrypt::Password.create(password)
    end
  end

  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
  end
end
