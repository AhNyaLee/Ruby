require 'pg'
class PG_client
  def initialize
    self.client = PG.connect(
      dbname: 'students',
      user: 'postgres',
      password: '1234',
      host: 'localhost',
      port: 1234
    )
  end
  private
  attr_accessor :client
end