class Data_list
  def initialize(list)
    self.list = list
  end
  
  def select(index)
    self.selected_elems = list[index]
  end
  
  def get_select(index)
    self.selected_elems = list[index]
    raise "Index out of range" if index < 0 || index >= list.length
    self.selected_indexes << index
  end

  private
  attr_accessor :list,  :selected_elems
end