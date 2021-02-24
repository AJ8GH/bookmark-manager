require 'pg'

class DatabaseConnection
  class << self
    attr_accessor :connection

    def setup(dbname:)
      self.connection = PG.connect(dbname: dbname)
    end

    def query(sql_query)
      connection.exec(sql_query)
    end
  end
end
