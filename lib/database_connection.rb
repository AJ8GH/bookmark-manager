require 'pg'

class DatabaseConnection
  class << self
    attr_accessor :connection

    def setup(database_name)
      self.connection = PG.connect(dbname: database_name)
    end

    def query(sql_query)
      connection.exec(sql_query)
    end
  end
end
