class Processing_array
  attr_accessor :array

  def initialize(array)
    self.array = array
  end

  def count_array(value=nil,&block )
    if value.nil? && block_given?
      count = 0
      self.array.each do |element|
        if yield(element) == true
          count += 1
        end
      end
       count
    elsif !value.nil? && !block_given?
      count = 0
      self.array.each do |element|
        if element == value.to_i
          count += 1
        end
      end
      count
    else
      self.array.size
    end
  end  
  
  def filter_map_array(&block)
    if !(block_given?)
      self.array.filter_map
    end
    
    result_array = Array.new()
    self.array.each do |element|
      result_array.append(block.call(element)) if !(block.call(element).nil?)
    end

   result_array
  end

  def group_by_array(value=nil,&block)
    if !(block_given?)
      return self.array.group_by
    end

    hash = {}
    self.array.each do |element|
      key = yield(element)
      if hash[key].nil?
        hash[key] = [element]
      else
        hash[key].append(element)
      end
    end

    return hash
  end 

end

array = Processing_array.new([1, 2, 3, 4, 5, 2, 3])


puts "Количество элементов больше 3: #{array.count_array() do |element| element >3 end}"

puts "Вывод чётных чисел: #{array.filter_map_array { |element| element if element.even?}}"

puts "Вывод чётных чисел: #{array.group_by_array { |element| element.even?}}"
