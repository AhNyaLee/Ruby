class Data_table
  def initialize(data)
    @data = data
  end

  private 
  
  def data=(data) # check if data is two-dimensional array
    if data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
      @data = data
    else
      raise TypeError, "Data must be a two-dimensional array"
    end
  end
end
