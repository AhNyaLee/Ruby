require 'pg'
class PG_client
 
  def exec(query)
    client.exec(query)
  end

  def exec_params(queryparams =[])
    client.exec_params(query, params)
  end
  
  def self.instance
    if @instance.nil?
      new
    else 
      @instance
    end
  end
  

  private
  attr_accessor :client
  @instance = nil
  def initialize
    self.client = PG.connect(
      dbname: 'students',
      user: 'postgres',
      password: '1234',
      host: 'localhost',
      port: 1234
    )
  end

end