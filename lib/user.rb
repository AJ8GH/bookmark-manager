class User
  attr_reader :id, :email, :password
  def self.create(email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (email, password)
      VALUES ('#{email}', '#{password}') RETURNING id;"
    ).first
    new(id: result['id'], email: email, password: password)
  end

  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
  end
end
